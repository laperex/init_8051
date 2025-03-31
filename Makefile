# Makefile for AT89S52 using SDCC

PROJECT = main
SRC = src/$(PROJECT).c
TARGET = $(PROJECT).hex
CHIP = AT89S52
PORT = /dev/ttyUSB0
UPLOAD_BAUD_RATE = 19200

all: $(TARGET)

$(TARGET): $(SRC)
	sdcc -mmcs51 --model-small --out-fmt-ihx $(SRC) -o build/$(PROJECT).ihx
	objcopy -I ihex -O ihex build/$(PROJECT).ihx build/$(TARGET)

flash: $(TARGET)
	avrdude -c arduino_as_isp -p $(CHIP) -P $(PORT) -b $(UPLOAD_BAUD_RATE) -U flash:w:build/$(TARGET):i

