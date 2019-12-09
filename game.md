# 调研头部端游的传输方式，寻找反映用户数量，用户数，在线工会的指标


## 1. steam和steamdb
steam平台有一些公开的api，[steamDB](https://steamdb.info)通过这些建立了社区，提供一些可视化排行数据
这里可以看到: 
1. 平台实时的在线人数和游戏人数，精确到每个游戏的人数
2. 每个游戏的历史最多人数和24小时内的最多人数
3. 游戏、package、补丁的更新
4. 单个游戏，组合发售的价格
5. Twitch在直播的热度(观看人数)
6. 基本囊括了大部分知名游戏: 绝地求生, Dota2, CSGO, Tom Clancsy's Rainbow Six Siege...
7. 一些游戏配有特定的主页：https://steamdb.info/app/570/graphs/

不足之处:
1. 按平台统计，不能代表全球水平，有的游戏会在多个平台上分发，不在steam上显示(比如PUBG中国区将来会在wegame上线, 英雄联盟就没有在线人数)
2. 

## 2. 其他: 
1. 英雄联盟因为在全球多个地区都是不同的代理商，且不在steam平台运营


## 3. 在线工会这些需要特定游戏特殊对待
英雄联盟和绝地求生这类游戏一般都不展示在线人数，没有展示页面也无从发现

## 4. newzoo PC游戏跟踪
1. 按硬件平台，游戏，发行商收入(基于财报分析)等排名
2. 基于overwolf游戏插件平台的数据