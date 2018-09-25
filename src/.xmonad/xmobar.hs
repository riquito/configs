Config {
    font = "xft:Dejavu Sans Mono:size=10:antialias=true:style=bold",
    bgColor = "#002b36",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1600, height = 16 },
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","Cpu: <total>%","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","2"] 10,
        Run CpuFreq ["-t", "at <cpu0>", "-L", "0", "-H", "2", "-l", "lightblue", "-n","white", "-h", "red", "--ddigits", "3"] 50,
        Run Memory ["-t","RAM <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run CoreTemp ["-t","<core0>°C","-L","40","-H","60","-l","lightblue","-n","gray90","-h","red"] 50,
        Run Swap ["-t","SwAP <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        -- Run Network "wlan0" ["-t","WiFI: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run DynNetwork ["-t","Net: <dev> <rx>KB|<tx>KB","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %H:%M" "date" 600,
        Run StdinReader,
        Run BatteryP ["AC", "BAT0", "BAT1"]
              ["-t", "AC <acstatus> <left>%",
               "-L", "35", "-H", "80", "-h", "lightblue", "-l", "red", "-n", "green",
               "--", "-O", "<fc=green>On </fc> /", "-o", "<fc=red>Off</fc> /", "-i", "idle",
               "-L", "-15", "-H", "-5",
               "-l", "red", "-m", "blue", "-h", "green"]
              30
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "  <fc=#00FF00>%date%</fc> %StdinReader% }{ | %multicpu% %cpufreq% | %coretemp% | %memory% | %swap% | %battery% | %dynnetwork%"
}
