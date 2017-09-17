setMode -bs
setMode -bs
setCable -port auto
Identify 
identifyMPM 
assignFile -p 1 -file "C:/allinone/ise/top/sokoban.mcs"
setAttribute -position 1 -attr packageName -value "(null)"
setMode -bs
addDevice -p 3 -file "C:/allinone/ise/top/top.bit"
deleteDevice -position 4
Program -p 3 -defaultVersion 0 
Program -p 3 -defaultVersion 0 
Program -p 3 -defaultVersion 0 
Program -p 3 -defaultVersion 0 
Program -p 3 -defaultVersion 0 
Program -p 1 -e -parallel -defaultVersion 0 
setCable -port auto
setCable -port auto
Program -p 3 -defaultVersion 0 
setMode -pff
setMode -pff
addConfigDevice  -name "final" -path "C:\allinone\ise\top\"
setSubmode -pffversion
setAttribute -configdevice -attr multibootBpiType -value ""
addDesign -version 0 -name "0000"
setMode -pff
addDeviceChain -index 0
setAttribute -configdevice -attr compressed -value "FALSE"
setAttribute -configdevice -attr compressed -value "FALSE"
setAttribute -configdevice -attr autoSize -value "FALSE"
setAttribute -configdevice -attr fileFormat -value "mcs"
setAttribute -configdevice -attr fillValue -value "FF"
setAttribute -configdevice -attr swapBit -value "FALSE"
setAttribute -configdevice -attr dir -value "UP"
setAttribute -configdevice -attr multiboot -value "FALSE"
setAttribute -configdevice -attr multiboot -value "FALSE"
setAttribute -configdevice -attr spiSelected -value "FALSE"
setAttribute -configdevice -attr spiSelected -value "FALSE"
addPromDevice -p 1 -size 0 -name xcf32p
setMode -pff
setMode -pff
deletePromDevice -position 1
setCurrentDesign -version 0
setCurrentDeviceChain -index 0
setCurrentDeviceChain -index 0
deleteDesign -version 0
setCurrentDesign -version -1
setMode -pff
addConfigDevice -size 256 -name "final" -path "C:\allinone\ise\top\/"
setSubmode -pffversion
setAttribute -configdevice -attr dir -value "UP"
setAttribute -configdevice -attr multibootBpiDevice -value ""
setAttribute -configdevice -attr multibootBpiType -value ""
setAttribute -configdevice -attr multibootBpichainType -value ""
setAttribute -configdevice -attr compressed -value "FALSE"
addPromDevice -p 1 -size 0 -name xcf32p
setMode -pff
setSubmode -pffversion
setAttribute -configdevice -attr size -value "0"
setAttribute -configdevice -attr dir -value "UP"
addDesign -version 0 -name "0000"
setMode -pff
addDeviceChain -index 0
setAttribute -design -attr RSPin -value ""
setCurrentDeviceChain -index 0
setCurrentDeviceChain -index 0
setAttribute -design -attr name -value "0"
addDevice -p 1 -file "C:/allinone/ise/top/top.bit"
setCurrentDeviceChain -index 0
setCurrentDeviceChain -index 0
setCurrentDeviceChain -index 0
setCurrentDeviceChain -index 0
setMode -bs
setMode -bs
setMode -pff
setMode -pff
setMode -pff
setSubmode -pffversion
setAttribute -configdevice -attr fillValue -value "FF"
setAttribute -configdevice -attr fileFormat -value "mcs"
setAttribute -configdevice -attr dir -value "UP"
setAttribute -configdevice -attr path -value "C:\allinone\ise\top\/"
setAttribute -configdevice -attr name -value "final"
setCurrentDeviceChain -index 0
generate
setCurrentDesign -version 0
setMode -bs
setMode -bs
assignFile -p 1 -file "C:/allinone/ise/top/final.mcs"
setAttribute -position 1 -attr packageName -value "(null)"
assignFile -p 1 -file "C:/allinone/ise/top/final.mcs"
setAttribute -position 1 -attr packageName -value "(null)"
assignFile -p 1 -file "C:/allinone/ise/top/final.mcs"
setAttribute -position 1 -attr packageName -value "(null)"
Program -p 1 -e -parallel -defaultVersion 0 
setMode -bs
deleteDevice -position 1
deleteDevice -position 1
deleteDevice -position 1
setMode -pff
setMode -pff
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
deletePromDevice -position 1
setCurrentDesign -version 0
setCurrentDeviceChain -index 0
deleteDevice -position 1
setCurrentDeviceChain -index 0
deleteDesign -version 0
setCurrentDesign -version -1
setMode -pff
setMode -pff
setAttribute -configdevice -attr multibootBpiDevice -value ""
setAttribute -configdevice -attr multibootBpiType -value ""
setAttribute -configdevice -attr multibootBpichainType -value ""
setMode -pff
setMode -pff
setMode -bs
