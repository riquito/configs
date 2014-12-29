Config {
    font = "xft:Dejavu Sans Mono:pixelsize=12:antialias=true:style=bold",
    bgColor = "#002b36",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1245, height = 16 },
    lowerOnStart = True,
    commands = [
        Run MultiCpu ["-t","Cpu: <total>%","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","2"] 10,
        Run CpuFreq ["-t", "Freq: <cpu0>", "-L", "0", "-H", "2", "-l", "lightblue", "-n","white", "-h", "red"] 50,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run CoreTemp ["-t","at <core0>C","-L","40","-H","60","-l","lightblue","-n","gray90","-h","red"] 50,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "eth0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %H:%M" "date" 600,
        Run StdinReader,
        Run BatteryP ["BAT0"]
              ["-t", "<acstatus><watts> (<left>%)",
               "-L", "10", "-H", "80", "-p", "3",
               "--", "-O", "<fc=green>On</fc> - ", "-o", "",
               "-L", "-15", "-H", "-5",
               "-l", "red", "-m", "blue", "-h", "green"]
              600
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "  <fc=#FFFFCC>%date%</fc> %StdinReader% }{ %multicpu% %cpufreq% %coretemp%  %memory%  %swap%  %battery%  %eth0% "
}
