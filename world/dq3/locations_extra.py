from __future__ import annotations

from . import rules
from .data import LocationInfo as Info
from .data import LocationType as Type


# List every extra locations (optional depending on options)
EXTRA_LOCATIONS: dict[str, Info] = {
    # ///////////////////////// SHINY SPOTS /////////////////////////
    # ----- Aliahan Overworld -----
    # 001 002 003 004 005 006 007 008 009 010 141
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 1": Info(1123, type=Type.SHINY), #SHINE_SEARCH_FG000_1
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 2": Info(1124, type=Type.SHINY_MAX), #SHINE_SEARCH_FG000_2
    "[Aliahan Overworld] Shiny Spot near Aliahan: Item 3": Info(1125, type=Type.SHINY_MAX), #SHINE_SEARCH_FG000_3
    "[Aliahan Overworld] Shiny Spot south-west of Aliahan: Item 1": Info(1126, type=Type.SHINY), #SHINE_SEARCH_FG114_1
    "[Aliahan Overworld] Shiny Spot south-west of Aliahan: Item 2": Info(1127, type=Type.SHINY_MAX), #SHINE_SEARCH_FG114_2
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 1": Info(1128, type=Type.SHINY), #SHINE_SEARCH_FG001_1
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 2": Info(1129, type=Type.SHINY_MAX), #SHINE_SEARCH_FG001_2
    "[Aliahan Overworld] Shiny Spot south of Shrine of the Plains: Item 3": Info(1130, type=Type.SHINY_MAX), #SHINE_SEARCH_FG001_3
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 1": Info(1131, type=Type.SHINY), #SHINE_SEARCH_FG120_1
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 2": Info(1132, type=Type.SHINY_MAX), #SHINE_SEARCH_FG120_2
    "[Aliahan Overworld] Shiny Spot north of Promontory Passage: Item 3": Info(1133, type=Type.SHINY_MAX), #SHINE_SEARCH_FG120_3
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 1": Info(1134, type=Type.SHINY), #SHINE_SEARCH_FG115_1
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 2": Info(1135, type=Type.SHINY_MAX), #SHINE_SEARCH_FG115_2
    "[Aliahan Overworld] Shiny Spot north-west of Promontory Passage: Item 3": Info(1136, type=Type.SHINY_MAX), #SHINE_SEARCH_FG115_3
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 1": Info(1137, type=Type.SHINY), #SHINE_SEARCH_FG116_1
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 2": Info(1138, type=Type.SHINY_MAX), #SHINE_SEARCH_FG116_2
    "[Aliahan Overworld] Shiny Spot on the west coast of the mountain west of Aliahan: Item 3": Info(1139, type=Type.SHINY_MAX), #SHINE_SEARCH_FG116_3
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 1": Info(1140, type=Type.SHINY), #SHINE_SEARCH_FG117_1
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 2": Info(1141, type=Type.SHINY_MAX), #SHINE_SEARCH_FG117_2
    "[Aliahan Overworld] Shiny Spot south-west of Reeve: Item 3": Info(1142, type=Type.SHINY_MAX), #SHINE_SEARCH_FG117_3
    "[Aliahan Overworld] Shiny Spot east of Reeve: Item 1": Info(1143, type=Type.SHINY), #SHINE_SEARCH_FG118_1
    "[Aliahan Overworld] Shiny Spot east of Reeve: Item 2": Info(1144, type=Type.SHINY_MAX), #SHINE_SEARCH_FG118_2
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 1": Info(1145, type=Type.SHINY), #SHINE_SEARCH_FG003_1
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 2": Info(1146, type=Type.SHINY_MAX), #SHINE_SEARCH_FG003_2
    "[Aliahan Overworld] Shiny Spot near the river north-west of Little Shrine: Item 3": Info(1147, type=Type.SHINY_MAX), #SHINE_SEARCH_FG003_3
    "[Aliahan Overworld] Shiny Spot near Little Shrine: Item 1": Info(1148, type=Type.SHINY), #SHINE_SEARCH_FG119_1
    "[Aliahan Overworld] Shiny Spot near Little Shrine: Item 2": Info(1149, type=Type.SHINY_MAX), #SHINE_SEARCH_FG119_2
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 1": Info(1150, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG002_1
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 2": Info(1151, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG002_2
    "[Aliahan Overworld] Shiny Spot on a small coast north of Path of Promise: Item 3": Info(1152, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG002_3
    # ----- Northwest Overworld -----
    # 011 066 012 013 214 018 019 014 017 020 021 125 022 016 015 212 023 024 211 231 025 213 129(4)
    "[Northwest Overworld] Shiny Spot north of Romarian Road: Item 1": Info(1153, type=Type.SHINY), #SHINE_SEARCH_FG004_1
    "[Northwest Overworld] Shiny Spot north of Romarian Road: Item 2": Info(1154, type=Type.SHINY_MAX), #SHINE_SEARCH_FG004_2
    "[Northwest Overworld] Shiny Spot on the small island south of Shrine of Promise: Item 1": Info(1155, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG177_1
    "[Northwest Overworld] Shiny Spot on the small island south of Shrine of Promise: Item 2": Info(1156, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG177_2
    "[Northwest Overworld] Shiny Spot on the small island south of Shrine of Promise: Item 3": Info(1157, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG177_3
    "[Northwest Overworld] Shiny Spot north-east of Romarian Road: Item 1": Info(1158, type=Type.SHINY), #SHINE_SEARCH_FG122_1
    "[Northwest Overworld] Shiny Spot north-east of Romarian Road: Item 2": Info(1159, type=Type.SHINY_MAX), #SHINE_SEARCH_FG122_2
    "[Northwest Overworld] Shiny Spot north-east of Romarian Road: Item 3": Info(1160, type=Type.SHINY_MAX), #SHINE_SEARCH_FG122_3
    "[Northwest Overworld] Shiny Spot south of Khoryv: Item 1": Info(1161, type=Type.SHINY), #SHINE_SEARCH_FG121_1
    "[Northwest Overworld] Shiny Spot south of Khoryv: Item 2": Info(1162, type=Type.SHINY_MAX), #SHINE_SEARCH_FG121_2
    "[Northwest Overworld] Shiny Spot south of Khoryv: Item 3": Info(1163, type=Type.SHINY_MAX), #SHINE_SEARCH_FG121_3
    "[Northwest Overworld] Shiny Spot in the mountain south-east of Khoryv: Item 1": Info(1164, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG016_1
    "[Northwest Overworld] Shiny Spot in the mountain south-east of Khoryv: Item 2": Info(1165, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG016_2
    "[Northwest Overworld] Shiny Spot in the mountain south-east of Khoryv: Item 3": Info(1166, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG016_3
    "[Northwest Overworld] Shiny Spot east of Khoryv: Item 1": Info(1167, type=Type.SHINY), #SHINE_SEARCH_FG081_1
    "[Northwest Overworld] Shiny Spot east of Khoryv: Item 2": Info(1168, type=Type.SHINY_MAX), #SHINE_SEARCH_FG081_2
    "[Northwest Overworld] Shiny Spot east of Khoryv: Item 3": Info(1169, type=Type.SHINY_MAX), #SHINE_SEARCH_FG081_3
    "[Northwest Overworld] Shiny Spot on the top edge coast of the snowy mountain north-east of Khoryv: Item 1": Info(1170, type=Type.SHINY), #SHINE_SEARCH_FG015_1
    "[Northwest Overworld] Shiny Spot on the top edge coast of the snowy mountain north-east of Khoryv: Item 2": Info(1171, type=Type.SHINY_MAX), #SHINE_SEARCH_FG015_2
    "[Northwest Overworld] Shiny Spot on the top edge coast of the snowy mountain north-east of Khoryv: Item 3": Info(1172, type=Type.SHINY_MAX), #SHINE_SEARCH_FG015_3
    "[Northwest Overworld] Shiny Spot north of Khoryv: Item 1": Info(1173, type=Type.SHINY), #SHINE_SEARCH_FG123_1
    "[Northwest Overworld] Shiny Spot north of Khoryv: Item 2": Info(1174, type=Type.SHINY_MAX), #SHINE_SEARCH_FG123_2
    "[Northwest Overworld] Shiny Spot north of Khoryv: Item 3": Info(1175, type=Type.SHINY_MAX), #SHINE_SEARCH_FG123_3
    "[Northwest Overworld] Shiny Spot near the coast north of Khoryv: Item 1": Info(1176, type=Type.SHINY), #SHINE_SEARCH_FG128_1
    "[Northwest Overworld] Shiny Spot near the coast north of Khoryv: Item 2": Info(1177, type=Type.SHINY_MAX), #SHINE_SEARCH_FG128_2
    "[Northwest Overworld] Shiny Spot on the coast west of Norvik: Item 1": Info(1178, type=Type.SHINY), #SHINE_SEARCH_FG005_1
    "[Northwest Overworld] Shiny Spot on the coast west of Norvik: Item 2": Info(1179, type=Type.SHINY_MAX), #SHINE_SEARCH_FG005_2
    "[Northwest Overworld] Shiny Spot on the coast west of Norvik: Item 3": Info(1180, type=Type.SHINY_MAX), #SHINE_SEARCH_FG005_3
    "[Northwest Overworld] Shiny Spot east of Faerie Village: Item 1": Info(1181, type=Type.SHINY), #SHINE_SEARCH_FG129_1
    "[Northwest Overworld] Shiny Spot east of Faerie Village: Item 2": Info(1182, type=Type.SHINY_MAX), #SHINE_SEARCH_FG129_2
    "[Northwest Overworld] Shiny Spot on a small coast north-east of Faerie Village: Item 1": Info(1183, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG006_1
    "[Northwest Overworld] Shiny Spot on a small coast north-east of Faerie Village: Item 2": Info(1184, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG006_2
    "[Northwest Overworld] Shiny Spot on a small coast north-east of Faerie Village: Item 3": Info(1185, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG006_3
    "[Northwest Overworld] Shiny Spot near Underground Lake: Item 1": Info(1186, type=Type.SHINY), #SHINE_SEARCH_FG125_1
    "[Northwest Overworld] Shiny Spot near Underground Lake: Item 2": Info(1187, type=Type.SHINY_MAX), #SHINE_SEARCH_FG125_2
    "[Northwest Overworld] Shiny Spot on the coast west of Khoryv: Item 1": Info(1188, type=Type.SHINY), #SHINE_SEARCH_FG124_1
    "[Northwest Overworld] Shiny Spot on the coast west of Khoryv: Item 2": Info(1189, type=Type.SHINY_MAX), #SHINE_SEARCH_FG124_2
    "[Northwest Overworld] Shiny Spot on the coast west of Khoryv: Item 3": Info(1190, type=Type.SHINY_MAX), #SHINE_SEARCH_FG124_3
    "[Northwest Overworld] Shiny Spot south-west of Khoryv: Item 1": Info(1191, type=Type.SHINY), #SHINE_SEARCH_FG007_1
    "[Northwest Overworld] Shiny Spot south-west of Khoryv: Item 2": Info(1192, type=Type.SHINY_MAX), #SHINE_SEARCH_FG007_2
    "[Northwest Overworld] Shiny Spot south-west of Khoryv: Item 3": Info(1193, type=Type.SHINY_MAX), #SHINE_SEARCH_FG007_3
    "[Northwest Overworld] Shiny Spot in the mountain north of Skyfell Tower: Item 1": Info(1194, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG008_1
    "[Northwest Overworld] Shiny Spot in the mountain north of Skyfell Tower: Item 2": Info(1195, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG008_2
    "[Northwest Overworld] Shiny Spot in the mountain north of Skyfell Tower: Item 3": Info(1196, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG008_3
    "[Northwest Overworld] Shiny Spot north of Skyfell Tower: Item 1": Info(1197, type=Type.SHINY), #SHINE_SEARCH_FG126_1
    "[Northwest Overworld] Shiny Spot north of Skyfell Tower: Item 2": Info(1198, type=Type.SHINY_MAX), #SHINE_SEARCH_FG126_2
    "[Northwest Overworld] Shiny Spot near Skyfell Tower: Item 1": Info(1199, type=Type.SHINY), #SHINE_SEARCH_FG127_1
    "[Northwest Overworld] Shiny Spot near Skyfell Tower: Item 2": Info(1200, type=Type.SHINY_MAX), #SHINE_SEARCH_FG127_2
    "[Northwest Overworld] Shiny Spot near Skyfell Tower: Item 3": Info(1201, type=Type.SHINY_MAX), #SHINE_SEARCH_FG127_3
    "[Northwest Overworld] Shiny Spot in the mountain east of Skyfell Tower: Item 1": Info(1202, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG009_1
    "[Northwest Overworld] Shiny Spot in the mountain east of Skyfell Tower: Item 2": Info(1203, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG009_2
    "[Northwest Overworld] Shiny Spot in the mountain east of Skyfell Tower: Item 3": Info(1204, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG009_3
    "[Northwest Overworld] Shiny Spot on the small coast south-east of Skyfell Tower: Item 1": Info(1205, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG010_1
    "[Northwest Overworld] Shiny Spot on the small coast south-east of Skyfell Tower: Item 2": Info(1206, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG010_2
    "[Northwest Overworld] Shiny Spot on the small coast south-east of Skyfell Tower: Item 3": Info(1207, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG010_3
    "[Northwest Overworld] Shiny Spot on the bottom edge coast south of Skyfell Tower: Item 1": Info(1208, type=Type.SHINY), #SHINE_SEARCH_FG011_1
    "[Northwest Overworld] Shiny Spot on the bottom edge coast south of Skyfell Tower: Item 2": Info(1209, type=Type.SHINY_MAX), #SHINE_SEARCH_FG011_2
    "[Northwest Overworld] Shiny Spot on the bottom edge coast south of Skyfell Tower: Item 3": Info(1210, type=Type.SHINY_MAX), #SHINE_SEARCH_FG011_3
    "[Northwest Overworld] Shiny Spot in the mountain north of Edina Castle: Item 1": Info(1211, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG013_1
    "[Northwest Overworld] Shiny Spot in the mountain north of Edina Castle: Item 2": Info(1212, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG013_2
    "[Northwest Overworld] Shiny Spot 1 on the island west of Edina Castle: Item 1": Info(1213, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG164_1
    "[Northwest Overworld] Shiny Spot 1 on the island west of Edina Castle: Item 2": Info(1214, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG164_2
    "[Northwest Overworld] Shiny Spot 2 on the island west of Edina Castle: Item 1": Info(1215, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG163_1
    "[Northwest Overworld] Shiny Spot 3 on the island west of Edina Castle: Item 1": Info(1216, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG162_1
    "[Northwest Overworld] Shiny Spot 3 on the island west of Edina Castle: Item 2": Info(1217, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG162_2
    "[Northwest Overworld] Shiny Spot 4 on the island west of Edina Castle: Item 1": Info(1218, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG014_1
    # ----- Great Desert Overworld -----
    # 026 027 028 029 069(2) 030 031 032 216 033 039 038 037(3) 035 034 208 036
    "[Great Desert Overworld] Shiny Spot south of the bridge between Asham and Romaria: Item 1": Info(1219, type=Type.SHINY), #SHINE_SEARCH_FG130_1
    "[Great Desert Overworld] Shiny Spot south of the bridge between Asham and Romaria: Item 2": Info(1220, type=Type.SHINY_MAX), #SHINE_SEARCH_FG130_2
    "[Great Desert Overworld] Shiny Spot south of the bridge between Asham and Romaria: Item 3": Info(1221, type=Type.SHINY_MAX), #SHINE_SEARCH_FG130_3
    "[Great Desert Overworld] Shiny Spot near the mountain north of Asham: Item 1": Info(1222, type=Type.SHINY), #SHINE_SEARCH_FG019_1
    "[Great Desert Overworld] Shiny Spot near the mountain north of Asham: Item 2": Info(1223, type=Type.SHINY_MAX), #SHINE_SEARCH_FG019_2
    "[Great Desert Overworld] Shiny Spot near the mountain north of Asham: Item 3": Info(1224, type=Type.SHINY_MAX), #SHINE_SEARCH_FG019_3
    "[Great Desert Overworld] Shiny Spot north-west of Asham: Item 1": Info(1225, type=Type.SHINY), #SHINE_SEARCH_FG131_1
    "[Great Desert Overworld] Shiny Spot north-west of Asham: Item 2": Info(1226, type=Type.SHINY_MAX), #SHINE_SEARCH_FG131_2
    "[Great Desert Overworld] Shiny Spot north-west of Asham: Item 3": Info(1227, type=Type.SHINY_MAX), #SHINE_SEARCH_FG131_3
    "[Great Desert Overworld] Shiny Spot near Asham: Item 1": Info(1228, type=Type.SHINY), #SHINE_SEARCH_FG134_1
    "[Great Desert Overworld] Shiny Spot near Asham: Item 2": Info(1229, type=Type.SHINY_MAX), #SHINE_SEARCH_FG134_2
    "[Great Desert Overworld] Shiny Spot 1 on the coast behind the mountain west of Asham: Item 1": Info(1230, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG018_1
    "[Great Desert Overworld] Shiny Spot 1 on the coast behind the mountain west of Asham: Item 2": Info(1231, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG018_2
    "[Great Desert Overworld] Shiny Spot 1 on the coast behind the mountain west of Asham: Item 3": Info(1232, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG018_3
    "[Great Desert Overworld] Shiny Spot 2 on the coast behind the mountain west of Asham: Item 1": Info(1233, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG176_1
    "[Great Desert Overworld] Shiny Spot 2 on the coast behind the mountain west of Asham: Item 2": Info(1234, rules.HAS_SHIP | rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG176_2
    "[Great Desert Overworld] Shiny Spot south of Asham: Item 1": Info(1235, type=Type.SHINY), #SHINE_SEARCH_FG132_1
    "[Great Desert Overworld] Shiny Spot south of Asham: Item 2": Info(1236, type=Type.SHINY_MAX), #SHINE_SEARCH_FG132_2
    "[Great Desert Overworld] Shiny Spot south of Asham: Item 3": Info(1237, type=Type.SHINY_MAX), #SHINE_SEARCH_FG132_3
    "[Great Desert Overworld] Shiny Spot south of the forest south of Asham: Item 1": Info(1238, type=Type.SHINY), #SHINE_SEARCH_FG133_1
    "[Great Desert Overworld] Shiny Spot south of the forest south of Asham: Item 2": Info(1239, type=Type.SHINY_MAX), #SHINE_SEARCH_FG133_2
    "[Great Desert Overworld] Shiny Spot south of the forest south of Asham: Item 3": Info(1240, type=Type.SHINY_MAX), #SHINE_SEARCH_FG133_3
    "[Great Desert Overworld] Shiny Spot west of the forest south of Asham: Item 1": Info(1241, type=Type.SHINY), #SHINE_SEARCH_FG021_1
    "[Great Desert Overworld] Shiny Spot west of the forest south of Asham: Item 2": Info(1242, type=Type.SHINY_MAX), #SHINE_SEARCH_FG021_2
    "[Great Desert Overworld] Shiny Spot in the center of the forest south of Asham: Item 1": Info(1243, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG020_1
    "[Great Desert Overworld] Shiny Spot in the center of the forest south of Asham: Item 2": Info(1244, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG020_2
    "[Great Desert Overworld] Shiny Spot in the center of the forest south of Asham: Item 3": Info(1245, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG020_3
    "[Great Desert Overworld] Shiny Spot in the forest on the coast north-east of the Pyramid: Item 1": Info(1246, type=Type.SHINY), #SHINE_SEARCH_FG137_1
    "[Great Desert Overworld] Shiny Spot in the forest on the coast north-east of the Pyramid: Item 2": Info(1247, type=Type.SHINY_MAX), #SHINE_SEARCH_FG137_2
    "[Great Desert Overworld] Shiny Spot in the forest on the coast north-east of the Pyramid: Item 3": Info(1248, type=Type.SHINY_MAX), #SHINE_SEARCH_FG137_3
    "[Great Desert Overworld] Shiny Spot north of the Pyramid: Item 1": Info(1249, type=Type.SHINY), #SHINE_SEARCH_FG138_1
    "[Great Desert Overworld] Shiny Spot north of the Pyramid: Item 2": Info(1250, type=Type.SHINY_MAX), #SHINE_SEARCH_FG138_2
    "[Great Desert Overworld] Shiny Spot north of the Pyramid: Item 3": Info(1251, type=Type.SHINY_MAX), #SHINE_SEARCH_FG138_3
    "[Great Desert Overworld] Shiny Spot north-west of Ibis: Item 1": Info(1252, type=Type.SHINY), #SHINE_SEARCH_FG139_1
    "[Great Desert Overworld] Shiny Spot north-west of Ibis: Item 2": Info(1253, type=Type.SHINY_MAX), #SHINE_SEARCH_FG139_2
    "[Great Desert Overworld] Shiny Spot north-west of Ibis: Item 3": Info(1254, type=Type.SHINY_MAX), #SHINE_SEARCH_FG139_3
    "[Great Desert Overworld] Shiny Spot 1 in the center of the desert north of Ibis: Item 1": Info(1255, type=Type.SHINY), #SHINE_SEARCH_FG142_1
    "[Great Desert Overworld] Shiny Spot 1 in the center of the desert north of Ibis: Item 2": Info(1256, type=Type.SHINY_MAX), #SHINE_SEARCH_FG142_2
    "[Great Desert Overworld] Shiny Spot 1 in the center of the desert north of Ibis: Item 3": Info(1257, type=Type.SHINY_MAX), #SHINE_SEARCH_FG142_3
    "[Great Desert Overworld] Shiny Spot 2 in the center of the desert north of Ibis: Item 1": Info(1258, type=Type.SHINY), #SHINE_SEARCH_FG140_1
    "[Great Desert Overworld] Shiny Spot 2 in the center of the desert north of Ibis: Item 2": Info(1259, type=Type.SHINY_MAX), #SHINE_SEARCH_FG140_2
    "[Great Desert Overworld] Shiny Spot 3 in the center of the desert north of Ibis: Item 1": Info(1260, type=Type.SHINY), #SHINE_SEARCH_FG141_1
    "[Great Desert Overworld] Shiny Spot north-east of Ibis: Item 1": Info(1261, type=Type.SHINY), #SHINE_SEARCH_FG022_1
    "[Great Desert Overworld] Shiny Spot north-east of Ibis: Item 2": Info(1262, type=Type.SHINY_MAX), #SHINE_SEARCH_FG022_2
    "[Great Desert Overworld] Shiny Spot north-east of Ibis: Item 3": Info(1263, type=Type.SHINY_MAX), #SHINE_SEARCH_FG022_3
    "[Great Desert Overworld] Shiny Spot in the rocky area north-east of Ibis: Item 1": Info(1264, type=Type.SHINY), #SHINE_SEARCH_FG136_1
    "[Great Desert Overworld] Shiny Spot in the rocky area north-east of Ibis: Item 2": Info(1265, type=Type.SHINY_MAX), #SHINE_SEARCH_FG136_2
    "[Great Desert Overworld] Shiny Spot in the mountain east of Ibis: Item 1": Info(1266, rules.HAS_BIRD, type=Type.SHINY), #SHINE_SEARCH_FG023_1
    "[Great Desert Overworld] Shiny Spot in the mountain east of Ibis: Item 2": Info(1267, rules.HAS_BIRD, type=Type.SHINY_MAX), #SHINE_SEARCH_FG023_2
    "[Great Desert Overworld] Shiny Spot near Desert Shrine: Item 1": Info(1268, type=Type.SHINY), #SHINE_SEARCH_FG135_1
    "[Great Desert Overworld] Shiny Spot near Desert Shrine: Item 2": Info(1269, type=Type.SHINY_MAX), #SHINE_SEARCH_FG135_2
    "[Great Desert Overworld] Shiny Spot near Desert Shrine: Item 3": Info(1270, type=Type.SHINY_MAX), #SHINE_SEARCH_FG135_3
    # ----- Portoga Overworld -----
    # 
    # ----- Central Overworld -----
    # 
    # ----- Eastern Overworld -----
    # 
    # ----- Southern Mountains Overworld -----
    # 
    # ----- Manoza Overworld -----
    # 
    # ----- Ocean Overworld -----
    # 
    # ----- Alefgard Overworld -----
    # 
}