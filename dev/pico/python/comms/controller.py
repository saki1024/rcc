#!/usr/bin/python3
# mostly stolen from Mike's/Jeannette's code
# adapted for Pico communications

from queue import Queue
from threading import Thread
import serial
import time
import traceback
import socket
from comms.messages import *

class CommsController():
	def __init__(self, port, baudrate=115200, timeout=10):
		self.outbound_thread = Thread(
			target=self.handle_outbound, daemon=True
		)
		self.inbound_thread = Thread(
			target=self.handle_inbound, daemon=True
		)
		self.outbound = Queue()
		self.inbound = Queue()

		self.ser = serial.Serial(
			port=port, baudrate=baudrate,
			parity=serial.PARITY_NONE,
			stopbits=serial.STOPBITS_ONE,
			bytesize=serial.EIGHTBITS,
			timeout=timeout
		)
		self.connected = True # sort of vestigial

		self.ser.write('switch-modes\n'.encode('utf-8'))
	
	def start_outbound(self):
		self.outbound_thread.start()
	
	def start_inbound(self):
		self.inbound_thread.start()

	def handle_outbound(self):
		while True:
			try:
				if not self.outbound.empty():
					p = self.outbound.get()
					p.write_to(self.ser)
			except:
				print('exception in outbound loop:')
				print(traceback.format_exc())

	def handle_inbound(self):
		while True:
			try:
				if self.ser.inWaiting() > 0:
					p = packet.Packet.read_from(self.ser)
					self.inbound.put(p)
			except:
				print('exception in inbound loop:')
				print(traceback.format_exc())

	def send(self, p):
		self.outbound.put(p)

	def has_packet(self):
		return not self.inbound.empty()

	def get_packet(self):
		return self.inbound.get()
	
class WirelessInterface:
	picoip = '192.168.0.111'
	porttopico = 9900
	computerip = '192.168.0.204'
	porttocomputer = 9999
	picohostname = 'PICOHOME'
	computerhostname = 'localhost'

	def __init__(self, picohostname, picoip, porttopico, computerhostname, computerip, porttocomputer):
		self.picoip = picoip
		self.porttopico = porttopico
		self.computerip = computerip
		self.porttocomputer = porttocomputer
		self.picohostname = picohostname
		self.computerhostname = computerhostname

class WirelessController(CommsController):
	def __init__(self, interface:WirelessInterface):
		self.outbound_thread = Thread(
		target=self.handle_outbound, daemon=True
		)
		self.inbound_thread = Thread(
			target=self.handle_inbound, daemon=True
		)
		self.outbound = Queue()
		self.inbound = Queue()

		# Setup UDP comm interface
		self.interface = interface
		self.sockout = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		self.sockin = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

		# Check the local ip and pico ip and warn if they are not equivalent
		try:
			# computerip = socket.gethostbyname("localhost")
			# picoip = socket.gethostbyname("picohostname")
			# assert computerip 	== interface.computerip, 'Computer ip is different'
			# assert picoip  		== interface.picoip, 'Pico ip is different'
			self.sockin.bind((self.interface.computerip, self.interface.porttocomputer))
			self.connected = True
		except AssertionError as e:
			print("Assertion Error")
		except Exception as e:
			print('exception in setup:')
			print(traceback.format_exc())
			self.connected = False
			print("Socket setup failed")
		# self.outbound_thread.start()
		# self.inbound_thread.start()

	def handle_outbound(self):
		while True:
			try:
				if not self.outbound.empty():
					p = self.outbound.get()
					p.wireless_write_to(self)
			except:
				print('exception in outbound loop:')
				print(traceback.format_exc())

	def handle_inbound(self):
		while True:
			try:
				data, addr = self.sockin.recvfrom(512)
				# assert addr[0] == self.interface.picoip, '[RECV]: unexpected IP address'
				p = Packet.read_from_raw(data)
				self.inbound.put(p)
			except AssertionError as e:
				print(e)
				# print(traceback.format_exc())
			except:
				print('exception in inbound loop:')
				print(traceback.format_exc())

# TODO: Setup way to pass in a function tree for each packet received definition
# This way we can effect values(systems) external to the wireless interface class
	def packet_receive_process(self, func, Ts=0.1):
		try:
			while True:
				while self.has_packet():
					pin = self.get_packet()
					func(pin) # Pass incoming packet to function passed into this function
		except Exception as e:
			print("Exception in packet_receive_process: ")
			print(traceback.format_exc())

def packet_receive_demux(p):
	if p.id_ == Twist.id():
		print(f"Received: {Twist(p)}")
	if p.id_ == Test_Inbound.id():
		print(f"Received: {Test_Inbound(p)}")
	if p.id_ == Sensor_Data.id():
		print(f"Received: {Sensor_Data(p)}")

if __name__ == "__main__":
	c = WirelessController(WirelessInterface)
	c.start_inbound()
	c.start_outbound()

	f1 = 0.0
	f2 = 1.0

	loop_time = 1
	while True:
		time.sleep(loop_time/3)

		# tout = Test_Outbound(f1, f2)
		# pout = tout.pack()
		# c.send(pout)
		time.sleep(loop_time/3)
		tout = Twist((1.5, 0.05))
		pout = tout.pack()

		print(f'sending:    {tout}')
		print(f'packet out: {pout}')

		time.sleep(loop_time/3)
		while c.has_packet():
			c.outbound.put(pout)
			pin = c.get_packet()
			packet_receive_demux(pin)
