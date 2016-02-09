import cv2
import numpy as np
import sys


BLOCKHEIGHT = 30
BLOCKWIDTH = 30
BLOCKSDOWN = 35
BLOCKSACROSS = 20

infile ='img.jpg'
outfile ='output.png'

img = cv2.imread(infile)
img = cv2.resize(img, (BLOCKSACROSS, BLOCKSDOWN))
img = img.reshape((BLOCKSACROSS * BLOCKSDOWN, 3))
img.sort(axis=0)
img = img[::-1]
img = img.reshape((BLOCKSDOWN, BLOCKSACROSS, 3))
img = img.repeat(BLOCKWIDTH, axis=0)
img = img.repeat(BLOCKHEIGHT, axis=1)
cv2.imwrite(outfile, img)
