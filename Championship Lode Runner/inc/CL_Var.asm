; ------------------------------------------------------------------------------------------------------------- ;
; Championship Lode Runner Game Variables
; ------------------------------------------------------------------------------------------------------------- ;
; memory layout
; ------------------------------------------------------------------------------------------------------------- ;
CL_MemScreenMC              = $0400 ; multi colors screen
CL_MemLevelGameData         = $0800 ; expanded level data - modified with    lr/en replacements/holes
CL_MemLevelCtrlData         = $0a00 ; expanded level data - original without lr/en replacements/holes
CL_MemSpriteStore           = $0c00 ; sprite data store
CL_MemScreenGfxRowPtr_Lo    = $0e00 ; ptr hires rows start addresses LO
CL_MemScreenGfxRowPtr_Hi    = $0f00 ; ptr hires rows start addresses HI
CL_MemLevelDataDiskBuf      = $1000 ; packed level data buffer/game save buffer
CL_MemScoreDataDiskBuf      = $1100 ; high scores save/load buffer
CL_MemWorkArea              = $1200 ; game dynamic work area values
CL_MemGameVars              = $1300 ; game variables
CL_MemStartGfxData          = $13b0 ; start graphic compressed input data - separately loaded
CL_MemScreenGfxDisplay      = $2000 ; display hires screen
CL_MemScreenGfxPrepare      = $4000 ; prepare hires screen for direct output
CL_MemTunePlayTime          = $c000 ; tune times buffer
CL_MemTuneDataPtrVoice2     = $c100 ; tune data pointer voice 2 buffer
CL_MemTuneDataPtrVoice3     = $c200 ; tune data pointer voice 3 buffer
CL_MemTuneSuReVol           = $c300 ; tune sustain/release/volume buffer
CL_MemUnused_01             = $c400 ; not used
CL_MemUnused_02             = $c500 ; not used
CL_MemUnused_03             = $c600 ; not used
CL_MemUnused_04             = $c700 ; not used
CL_MemBufScoreWork          = $c800 ; temp store for leaderboard update
CL_MemBufScoreWorkNew       = $c900 ; temp store for leaderboard update result
; ------------------------------------------------------------------------------------------------------------- ;
; game control tables
; ------------------------------------------------------------------------------------------------------------- ;
CL_LevelGameData            = CL_MemLevelGameData           ; 
CL_LevelCtrlData            = CL_MemLevelCtrlData           ; 
; ------------------------------------------------------------------------------------------------------------- ;
CL_HiresRowStartPtrTab_Lo   = CL_MemScreenGfxRowPtr_Lo      ; 
CL_HiresRowStartPtrTab_Hi   = CL_MemScreenGfxRowPtr_Hi      ; 
; ------------------------------------------------------------------------------------------------------------- ;
; start track number of level data blocks
; ------------------------------------------------------------------------------------------------------------- ;
CL_LevelDataStartTrackNum   = $03                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; level disc layout - the level data is compressed into one disk block (1 data byte = 2 level bytes)
; ------------------+------------------+----------------+------------------------------------------------------ ;
; TT / SS - TT / SS ! Disk Numbers    ! Level Numbers   ! 
; ------------------+-----------------+-----------------+------------------------------------------------------ ;
; $03/$00 - $03/$0f | Level 000 - 015 | Level 001 - 016 | each track contains 16 level blocks ($00-$0f)
; $04/$00 - $04/$0f | Level 016 - 031 | Level 017 - 032 | ----------------------------------------------------- ; 
; $05/$00 - $05/$0f | Level 032 - 047 | Level 033 - 048 | Track_number  = INT(CL_LevelNumDisk/16) + $03
; $06/$00 - $06/$01 | Level 048 - 049 | Level 049 - 050 | Sector_number = CL_LevelNumDisk MOD 15
; ------------------+-----------------+-----------------+----------------------------------------------------- ;
;           $0c/$07 | Level  151 - Scores / Top Scorer Msg / Disk ID block
;           $0c/$0b | Level  155 - Save Games
; ------------------+------------------------------------------------------------------------------------------ ;
; Level Data Block Layout - $1000
; ------------------------------------------------------------------------------------------------------------- ;
CL_LevelDataBuf             = CL_MemLevelDataDiskBuf        ; 
CL_LevelDataBufData         = CL_LevelDataBuf               ; packed level data - 2 level tiles in one byte 
CL_LevelDataBufData_Len       = CL_LevelDataBufDataRow_Len * CL_LevelDataBufDataRow_Num ; 
CL_LevelDataBufDataRow_Len    = $0e                         ; each level data row consists of $0e bytes 
CL_LevelDataBufDataRow_Num    = $10                         ; each level data block consists of $10 rows
; ------------------------------------------------------------------------------------------------------------- ;
; all gold collected message area
; ------------------------------------------------------------------------------------------------------------- ;
CL_LevelDataBufMsg          = CL_LevelDataBuf    + $e0      ; message text and id                 .hbu007.
CL_LevelDataBufMsgHdr       = CL_LevelDataBufMsg + $00      ; $00 $00                             .hbu007.
CL_LevelDataBufMsgHdr_Len     = $02                         ;                                     .hbu007.
CL_LevelDataBufMsgTxt       = CL_LevelDataBufMsg + $02      ; level victory message text          .hbu007.
CL_LevelDataBufMsgTxt_Len     = $0f                         ; max 15 text chrs                    .hbu007.
CL_LevelDataBufMsgID        = CL_LevelDataBufMsg + $12      ; $00 $00 $00 LODE RUNNEr             .hbu007.
CL_LevelDataBufMsgID_Len      = $0d                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; high score block counter values
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufEntry_Max        = $0a                                             ; max $0a entries
CL_ScoreBufEntry_Len        = CL_ScoreBufValue_Lo  - CL_ScoreBufName + $01    ; $0d
CL_ScoreBufEntry_Len_Old    = CL_ScoreBufEntry_Len - CL_ScoreBufName_Len_Diff ; $08
CL_ScoreBufTable_Len        = CL_ScoreBufEntry_Len * CL_ScoreBufEntry_Max     ; $82
CL_ScoreBufTable_Len_Old    = CL_ScoreBufEntry_Len_Old * CL_ScoreBufEntry_Max ; $50
; ------------------------------------------------------------------------------------------------------------- ;
; flags for ScoreDiskHandler checking
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufCheck_Bad        = $00                           ; loderunner disk ID not found
CL_ScoreBufCheck_Mod_No     = $01                           ; loderunner master disk - not modifiable
CL_ScoreBufCheck_Mod_Yes    = $ff                           ; loderunner user level data disk - modifiable
; ------------------------------------------------------------------------------------------------------------- ;
; high score block layout - $1100 - level number $97(151) - at disk tt=$0c/ss=$07
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBuf                 = CL_MemScoreDataDiskBuf        ; high scores
CL_ScoreBuf_Len             = $fb                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; 10 leaderboard entries
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufName             = CL_ScoreBuf + $00             ; 8 chr name
CL_ScoreBufName_Len           = $08                         ; len championship loderunner name
CL_ScoreBufName_Len_Old       = $03                         ; len loderunner id
CL_ScoreBufName_Len_Diff      = CL_ScoreBufName_Len - CL_ScoreBufName_Len_Old ; len difference LR/CL
CL_ScoreBufLevel            = CL_ScoreBuf + $08             ; level reached - sort crit 01
                            
CL_ScoreBufValue            = CL_ScoreBuf + $09             ; score reached - sort crit 02
CL_ScoreBufValue_Hi           = CL_ScoreBufValue + $00      ; score reached - sort crit 02
CL_ScoreBufValue_Mid_Hi       = CL_ScoreBufValue + $01      ; packed decimal - two digits in one byte
CL_ScoreBufValue_Mid_Lo       = CL_ScoreBufValue + $02      ; 
CL_ScoreBufValue_Lo           = CL_ScoreBufValue + $03      ; 
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufEmpty_01         = CL_ScoreBuf + $82             ; free
CL_ScoreBufEmpty_01_Len       = $2e                         ;  
; ------------------------------------------------------------------------------------------------------------- ;
; buffer for the values of the player who completed the last level and the game
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufTopMsg           = CL_ScoreBuf + $b0             ; top scorers message
CL_ScoreBufTopMsg_Len         = CL_InputBufferLen           ; 
CL_ScoreBufTopScore         = CL_ScoreBuf + $c4             ; 
CL_ScoreBufTopScore_Lo        = CL_ScoreBufTopScore + $00   ; top scorers score
CL_ScoreBufTopScore_Mid_Lo    = CL_ScoreBufTopScore + $01   ; 
CL_ScoreBufTopScore_Mid_Hi    = CL_ScoreBufTopScore + $02   ; 
CL_ScoreBufTopScore_Hi        = CL_ScoreBufTopScore + $03   ; 
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufEmpty_02         = CL_ScoreBuf + $c6             ; free
CL_ScoreBufEmpty_02_Len        = $28                        ; 
; ------------------------------------------------------------------------------------------------------------- ;
; champioship lode runner special
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufSerNumCount      = CL_ScoreBuf + $ee             ; counter serial no enters
CL_ScoreBufSerNumCount_Max     = $02                        ; 
CL_ScoreBufUniquePlayID     = CL_ScoreBuf + $ef             ; loderunner unique playid
; ------------------------------------------------------------------------------------------------------------- ;
; championship lode runner disk ID with low char 'd'
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufDiskId           = CL_ScoreBuf + $f0             ; dANE BIGHAM
CL_ScoreBufDiskId_Len         = $0a                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; lode runner disk flag
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufDiskFlag         = CL_ScoreBuf + $fb             ; user/master disk indicator
CL_ScoreBufDiskFlag_User      = $00                         ; lode runner user level data disk
CL_ScoreBufDiskFlag_Master    = $ff                         ; lode runner master disk
; ------------------------------------------------------------------------------------------------------------- ;
; to complete 255 block bytes
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScoreBufEmpty_03         = CL_ScoreBuf + $fc             ; free
CL_ScoreBufEmpty_03_Len       = $04                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; save game block layout - $1000 - level number $9b(155) - at disk tt=$0c/ss=$0b
; ------------------------------------------------------------------------------------------------------------- ;
CL_SaveGameBuf              = CL_MemLevelDataDiskBuf        ; 
CL_SaveGameBufEntry_Max       = $0a                         ; max number of save list entries
CL_SaveGameBufEntryLen        = $10                         ; length of each save list entry
CL_SaveGameBuf_Len          = CL_SaveGameBufEntryLen * CL_SaveGameBufEntry_Max ; length of the whole save list block
CL_SaveGameBufName          = CL_SaveGameBuf   + $00       ; player name
CL_SaveGameBufName_Len        = $08                         ; 
CL_SaveGameBufLevelGame     = CL_SaveGameBuf   + $08       ; game level number
CL_SaveGameBufLevelDisk     = CL_SaveGameBuf   + $09       ; disk level number
CL_SaveGameBufNumLives      = CL_SaveGameBuf   + $0a       ; number of lives
CL_SaveGameBufScore         = CL_SaveGameBuf   + $0b       ; score
CL_SaveGameBufScore_Hi        = CL_SaveGameBuf + $0b       ; 
CL_SaveGameBufScore_MiHi      = CL_SaveGameBuf + $0c       ; 
CL_SaveGameBufScore_MiLo      = CL_SaveGameBuf + $0d       ; 
CL_SaveGameBufScore_Lo        = CL_SaveGameBuf + $0e       ; 
                            
CL_SaveGameBufId            = CL_SaveGameBuf   + $f0       ; if valid must be set to "DJB"
CL_SaveGameBufIdChar_01       = CL_SaveGameBufId + $00     ; 'D'
CL_SaveGameBufIdChar_02       = CL_SaveGameBufId + $01     ; 'J'
CL_SaveGameBufIdChar_03       = CL_SaveGameBufId + $02     ; 'B'
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Color Positions on Start Screen
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScreenStartGfx           = CL_MemScreenMC                ; 
CL_ScreenStartGfx_BroderB1  = CL_ScreenMC + $0000           ; Broderbund Software
CL_ScreenStartGfx_BroderB2  = CL_ScreenMC + $0018           ; Broderbund Software
CL_ScreenStartGfx_LR        = CL_ScreenMC + $0168           ; LODE RUNNER
CL_ScreenStartGfx_Presents  = CL_ScreenMC + $0118           ; Presents
CL_ScreenStartGfx_By        = CL_ScreenMC + $0258           ; By
CL_ScreenStartGfx_Bigham    = CL_ScreenMC + $02d0           ; DOUG SMITH AND DANE BIGHAM
CL_ScreenStartGfx_CoRi      = CL_ScreenMC + $0348           ; (c) Copyright 1983
                            
CL_ScreenMC                 = CL_MemScreenMC                ; 
CL_ScreenMC_Page0           = CL_ScreenMC + $0000           ; 
CL_ScreenMC_Page1           = CL_ScreenMC + $0100           ; 
CL_ScreenMC_Page2           = CL_ScreenMC + $0200           ; 
CL_ScreenMC_Page3           = CL_ScreenMC + $02f8           ; 
CL_ScreenMC_Status          = CL_ScreenMC + $0370           ; 
CL_ScreenMC_Title           = CL_ScreenMC + $0398           ; title scores
CL_ScreenMC_Msg             = CL_ScreenMC + $03aa           ; message
CL_ScreenMC_MsgColor_Len      = $17                         ; message color length
                            
CL_ColorRam_Page0           = COLORAM_PAGE_0                ; 
CL_ColorRam_Page1           = COLORAM_PAGE_1                ; 
CL_ColorRam_Page2           = COLORAM_PAGE_2                ; 
CL_ColorRam_Page3           = COLORAM_PAGE_3                ; 
                            
CL_ColorRam_Status          = COLORAM_PAGE_3 + $b0          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; misc values
; ------------------------------------------------------------------------------------------------------------- ;
; level data tile numbers
; ------------------------------------------------------------------------------------------------------------- ;
CL_TileNum_Empty            = $00                           ; 
CL_TileNum_BrickSoft        = $01                           ; 
CL_TileNum_BrickHard        = $02                           ; 
CL_TileNum_Ladder           = $03                           ; 
CL_TileNum_Pole             = $04                           ; 
CL_TileNum_BrickTrap        = $05                           ; 
CL_TileNum_LadderExit       = $06                           ; 
CL_TileNum_Gold             = $07                           ; 
CL_TileNum_Enemy            = $08                           ; 
CL_TileNum_LodeRunner       = $09                           ; 
                            
CL_LevelTileNum_Max         = CL_TileNum_LodeRunner + $01   ; valid tile number range is $00-$09
                            
CL_ScreenCols_Min           = $00                           ; screen position - max left
CL_ScreenCols_Max           = $1b                           ; screen position - max right
CL_ScreenRows_Min           = $00                           ; screen position - max up
CL_ScreenRows_Max           = $0f                           ; screen position - max down
                            
CL_EnemyMoveDir_None        = $00                           ; for save enemy status
CL_EnemyMoveDir_Le          = $01                           ; 
CL_EnemyMoveDir_Ri          = $02                           ; 
CL_EnemyMoveDir_Up          = $03                           ; 
CL_EnemyMoveDir_Do          = $04                           ; 
                            
CL_ImageHeight              = $0b                           ; image dimensions
CL_ImageWidth               = $0a                           ; 
                            
CL_PosOnImage_Min           = $00                           ; 
CL_PosOnImage_Center        = $02                           ; position on image
CL_PosOnImage_Max           = $04                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; score values
; ------------------------------------------------------------------------------------------------------------- ;
CL_Score_EnemyDigIn         = $0100                         ; 2 byte bcd - score for digging in enemies
CL_Score_EnemyRebirth       = $0100                         ; 2 byte bcd - score for enemy rebirth
CL_Score_Gold               = $0500                         ; 2 byte bcd - score for picking up gold
CL_Score_FinishLevel        =  2000                         ; decimal    - needed for score step calc in LRZ_ScoreTuneSub_Ini
                            
CL_DiskRead                 = $01                           ; read  flag
CL_DiskWrite                = $02                           ; write flag
CL_DiskInit                 = $04                           ; init  flag
CL_DiskCheckDemo            = $80                           ;       flag: check for demo mode with CL_DiskRead/CL_DiskWrite
                            
CL_SpinSignSpeed_Fast       = $01                           ; fast speed flip sign
CL_SpinSignSpeed_Slow       = $64                           ; slow speed flip sign
                            
CL_SerialNumber_Len         = $05                           ; Championship Loderunner serial number length
; ------------------------------------------------------------------------------------------------------------- ;
; checksum calculations
; ------------------------------------------------------------------------------------------------------------- ;
CL_ChecksumCalc_Start       = $db                           ; checksum seed
CL_ChecksumCalc_Flip        = %00000001                     ; checksum flip bit
CL_ChecksumCalc_Result      = $d5                           ; checksum result
; ------------------------------------------------------------------------------------------------------------- ;
; sprite pointers and storage
; ------------------------------------------------------------------------------------------------------------- ;
CL_SpritePtr                = CL_MemScreenMC + SPNTR_OFFSET    ; sprite data pointers
CL_SpritePtr_00             = CL_SpritePtr + $00               ; sprite 0 data at $0c00
CL_SpritePtr_02             = CL_SpritePtr + $02               ; sprite 2 data at $0c40
CL_SpritePtr_03             = CL_SpritePtr + $03               ; sprite 3 data at $0c80
CL_SpritePtr_04             = CL_SpritePtr + $04               ; sprite 4 data at $0cc0
CL_SpritePtr_06             = CL_SpritePtr + $06               ; sprite 6 data at $0d00
CL_SpritePtr_07             = CL_SpritePtr + $07               ; sprite 7 data at $0d40
                            
CL_SpriteData               = CL_MemSpriteStore                ; sprite data storage
CL_SpriteData_00            = CL_SpriteData + SPRT_BLK_LEN * $00 ; sprite data store 0
CL_SpriteData_01            = CL_SpriteData + SPRT_BLK_LEN * $01 ; sprite data store 1
CL_SpriteData_02            = CL_SpriteData + SPRT_BLK_LEN * $02 ; sprite data store 2
CL_SpriteData_03            = CL_SpriteData + SPRT_BLK_LEN * $03 ; sprite data store 3
CL_SpriteData_04            = CL_SpriteData + SPRT_BLK_LEN * $04 ; sprite data store 4
CL_SpriteData_05            = CL_SpriteData + SPRT_BLK_LEN * $05 ; sprite data store 5
CL_SpriteData_06            = CL_SpriteData + SPRT_BLK_LEN * $06 ; sprite data store 6 - not used
CL_SpriteData_07            = CL_SpriteData + SPRT_BLK_LEN * $07 ; sprite data store 7 - not used

CL_SpriteDataPage_01        = CL_MemSpriteStore + SPRT_BLK_LEN * $00 ; 
CL_SpriteDataPage_02        = CL_MemSpriteStore + SPRT_BLK_LEN * $04 ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Work Area Exit Ladders - start at $1200
; ------------------------------------------------------------------------------------------------------------- ;
CL_WA_ExitLadder            = CL_MemWorkArea                ; $1200 - hidden ladders col
CL_WA_ExitLadderBlock_Len     = $30                         ;         max number of hidden ladders
CL_WA_ExitLadder_Free         = $ff                         ;         free hidden ladder table pos
CL_WA_ExitLadderMark        = CL_MemWorkArea                ; $1200 - position one acts as a marker
CL_WA_ExitLadderMark_Free     = $00                         ;         marker is free
CL_WA_ExitLadderMark_Gold     = $01                         ;         marker hidden ladder replaced gold
CL_WA_ExitLadderCol         = CL_WA_ExitLadder + CL_WA_ExitLadderBlock_Len * $00 ; $1200 - hidden ladders col
CL_WA_ExitLadderRow         = CL_WA_ExitLadder + CL_WA_ExitLadderBlock_Len * $01 ; $1230 - hidden ladders row
; ------------------------------------------------------------------------------------------------------------- ;
; Save Area Enemies - start at $1260
; ------------------------------------------------------------------------------------------------------------- ;
CL_SA_Enemy                 = CL_WA_ExitLadderRow + CL_WA_ExitLadderBlock_Len ; $1260 - col num of actual enemy position
CL_SA_EnemyBlock_Len          = $08                                    ;         max number of enemies
CL_SA_EnemyCol              = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $00 ; $1260 - col num of actual enemy position
CL_SA_EnemyRow              = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $01 ; $1268 - row num of actual enemy position
CL_SA_EnemyHoleGoldTime     = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $02 ; $1270 - enemy either has gold or is locked in a hole
CL_SA_EnemyHoleGoldTime_Ini   = $7f                                    ;         initial value
CL_SA_EnemyPosOnImgPosX     = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $03 ; $1278 - actual enemy position on image left/right
CL_SA_EnemyPosOnImgPosY     = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $04 ; $1280 - actual enemy position on image up/down
CL_SA_EnemySprtNum          = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $05 ; $1288 - sprite number
CL_SA_EnemyViewDir          = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $06 ; $1290 - sprite move direction
CL_WA_EnemyBirthTime        = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $07 ; $1298 - actual enemy rebirth step time
CL_WA_EnemyBirth_Len          = $05                                    ;         0 - 5 = max 6 entries
CL_WA_EnemyBirthStep_Ini      = $14                                    ;         initial value
CL_WA_EnemyBirthStep_01       = $13                                    ;         1st mark to rebirth the enemy a bit
CL_WA_EnemyBirthStep_02       = $0a                                    ;         2nd mark to rebirth the enemy a bit
; ------------------------------------------------------------------------------------------------------------- ;
; Work Area Open Holes - start at $12e0
; ------------------------------------------------------------------------------------------------------------- ;
CL_WA_Hole                  = CL_SA_Enemy + CL_SA_EnemyBlock_Len * $08 ; $12e0 - col open holes
CL_WA_HoleBlock_Len           = $20                                    ;         max number of open holes
CL_WA_HoleMax                 = $1e                                    ;         max number of digged holes
CL_WA_HoleCol               = CL_WA_Hole + CL_WA_HoleBlock_Len * $00   ; $12e0 - col open holes
CL_WA_HoleRow               = CL_WA_Hole + CL_WA_HoleBlock_Len * $01   ; $12a0 - row open holes
CL_WA_HoleOpenTime          = CL_WA_Hole + CL_WA_HoleBlock_Len * $02   ; $12c0 - actual hole open time
CL_WA_HoleOpenTime_Ini        = $b4                                    ;         initial value
CL_WA_HoleOpenTimeStep_01     = $14                                    ;         1st mark to close the hole a bit
CL_WA_HoleOpenTimeStep_02     = $0a                                    ;         2nd mark to close the hole a bit
; ------------------------------------------------------------------------------------------------------------- ;
; In Game Vaiables - start at $1300
; ------------------------------------------------------------------------------------------------------------- ;
CL_GameVars                 = CL_MemGameVars                ; $1300
CL_LevelLoad                = CL_GameVars + $00             ; $1300 - level disk load control
CL_LevelLoad_No               = $00                         ;         level already loaded from disk - reinit only
CL_LevelLoad_Yes              = $01                         ;         force level reload from disk and init
CL_ExitLadderCount          = CL_GameVars + $01             ; $1301 - 
CL_ExitLadderCount_None       = $00                         ; 
CL_ExitLadderCount_Max        = CL_WA_ExitLadderBlock_Len   ; 
CL_TuneBeepFall             = CL_GameVars + $02             ; $1302 - 
CL_TuneBeepFall_Start         = $53                         ; 
CL_ColorSetEnemy            = CL_GameVars + $03             ; $1303 - actual colorset no for enemy rebirth coloring
CL_CirclePhase              = CL_GameVars + $04             ; $1304 - show level start circle
CL_CirclePhase_Open           = $00                         ; 
CL_CirclePhase_Both           = $ff                         ; 
CL_LevelNumGame             = CL_GameVars + $05             ; $1305 - 
CL_LevelNumGame_Min           = $01                         ; 
CL_LevelNumGame_Max           = $33                         ; 
CL_LevelNumDemo_Max           = $04                         ; 
CL_LevelNumMax_Demo           = $02                         ;         maximum no of demo levels
CL_GameMode                 = CL_GameVars + $06             ; $1306 - $00=start $01=demo $02=game
CL_GameMode_Start             = $00                         ;         show start grafic
CL_GameMode_Demo              = $01                         ;         show the 3 demo level play
CL_GameMode_Play              = $02                         ;         play a level / show the score screen
CL_Digit                    = CL_GameVars + $07             ; $1307 - 
CL_Digit_100                  = CL_Digit  + $00             ; $1307 - 
CL_Digit_10                   = CL_Digit  + $01             ; $1308 - 
CL_Digit_1                    = CL_Digit  + $02             ; $1309 - 
CL_Score                    = CL_GameVars + $0a             ; $130a - 
CL_Score_Lo                   = CL_Score  + $00             ; $130a - 
CL_Score_MidLo                = CL_Score  + $01             ; $130b - 
CL_Score_MidHi                = CL_Score  + $02             ; $130c - 
CL_Score_Hi                   = CL_Score  + $03             ; $130d - 
; ------------------------------------------------------------------------------------------------------------- ;
CL_GoldToCollect            = CL_GameVars + $0e             ; $130e - 
CL_GoldToCollect_None         = $00                         ; 
CL_ControllerType           = CL_GameVars + $0f             ; $130f - 
CL_ControllerType_Joystick    = $ca                         ; 
CL_ControllerType_Keyboard    = $cb                         ; 
CL_LevelNumDisk             = CL_GameVars + $10             ; $1310 - 
CL_LevelNumDisk_Min           = CL_LevelNumGame_Min - $01   ;         000
CL_LevelNumDisk_Max           = CL_LevelNumGame_Max - $01   ;         049
CL_LevelNumDisk_Max_Init      = CL_LevelNumGame_Max + $62   ;         149
CL_LevelNumDisk_Gap           = CL_LevelNumGame_Max         ;         050 - empty game restart block (a level without a lodrunner tile)
CL_LevelNumDisk_Score         = CL_LevelNumGame_Max + $64   ;         151 - scores block     (tt=$0c/ss=$07)
CL_LevelNumDisk_Save          = CL_LevelNumDisk_Max + $69   ;         155 - save games block (tt=$0c/ss=$07)
CL_LevelNumDisk_Demo_Max      = $03                         ;         003 - build in demo levels 
CL_GameSpeedCtrl            = CL_GameVars + $11             ; $1311 - 
CL_GameSpeedCtrl_Max          = $0a                         ; 
CL_NumLives                 = CL_GameVars + $12             ; $1312 - 
CL_NumLivesInit               = $05                         ; 
CL_NumLivesDemo               = $01                         ; 
CL_Volume                   = CL_GameVars + $13             ; $1313 - 
CL_Volume_Off                 = $00                         ; 
CL_Volume_Max                 = $ff                         ; 
CL_LodeRuState              = CL_GameVars + $14             ; $1314 - 
CL_LodeRuState_Death          = $00                         ; 
CL_LodeRuState_Alive          = $01                         ; 
CL_LodeRuFallsDown          = CL_GameVars + $15             ; $1315 - $00=fall $20=no fall $ff=init
CL_LodeRuFallsDown_Yes        = $00                         ; 
CL_LodeRuFallsDown_No         = $20                         ; 
CL_LodeRuShoot              = CL_GameVars + $16             ; $1316 - $00=no $01=right $ff=left
CL_LodeRuShoot_No             = $00                         ; 
CL_LodeRuShoot_Ri             = $01                         ; 
CL_LodeRuShoot_Le             = $ff                         ; 
CL_TuneShoot                = CL_GameVars + $17             ; $1317 - 
CL_TuneShoot_Start            = $00                         ; 
CL_TuneShoot_Step             = $20                         ; 
CL_Cheated                  = CL_GameVars + $18             ; $1318 - $01=no
CL_Cheated_Yes                = $00                         ; 
CL_Cheated_No                 = $01                         ; 
CL_JoystickMoveDirY         = CL_GameVars + $19             ; $1319 - Joystick direction up/down
CL_JoystickMoveDirY_Up        = $21                         ; 
CL_JoystickMoveDirY_Do        = $25                         ; 
CL_JoystickMoveDirX         = CL_GameVars + $1a             ; $131a - Joystick direction left/right
CL_JoystickMoveDirX_Le        = $22                         ; 
CL_JoystickMoveDirX_Ri        = $2a                         ; 
CL_JoystickMove_None          = $00                         ; 
CL_JoystickShoot_Le           = $1e                         ; 
CL_JoystickShoot_Ri           = $26                         ; 
CL_GameSpeed                = CL_GameVars + $1b             ; $131b - 
CL_GameSpeed_Min              = $03                         ; 
CL_GameSpeed_Normal           = $05                         ; 
CL_GameSpeed_Max              = $08                         ; 
CL_EnemyCount               = CL_GameVars + $1c             ; $131c - 
CL_EnemyCount_None            = $00                         ; 
CL_EnemyCount_Min             = $01                         ; 
CL_EnemyCount_Max             = $05                         ; 
CL_LodeRuGetGold            = CL_GameVars + $1d             ; $131d - get gold  0=just gets it
CL_LodeRuGetGold_Picking      = $00                         ; 
CL_LodeRuGetGold_Picked       = $01                         ; 
CL_EnemyBirthCol            = CL_GameVars + $1e             ; $131e - 
CL_EnemyBirthCol_Min          = $00                         ; 
CL_EnemyBirthCol_Max          = $1c                         ; 
CL_EnemyToMoveNum           = CL_GameVars + $1f             ; $131f - 
CL_EnemyToMoveNum_None        = $00                         ; 
CL_EnemyToMoveNum_Min         = $01                         ; 
CL_EnemyInHoleTime          = CL_GameVars + $20             ; $1320 - init values dynamically taken from in game:TabEnmyHoleTime
CL_WaitTime_Lo              = CL_GameVars + $21             ; $1321 - 
CL_WaitTime_Hi              = CL_GameVars + $22             ; $1322 - 
CL_DisplayChr               = CL_GameVars + $23             ; $1323 - 
CL_HiresRowColNumAdd_Lo     = CL_GameVars + $24             ; $1326 - 
CL_HiresRowColNumAdd_Hi     = CL_GameVars + $25             ; $1325 - 
CL_HiresBlockCount          = CL_GameVars + $26             ; $1326 - 
CL_WorkTextOutputLen        = CL_GameVars + $26             ; $1326 - 
CL_StartGfxTabOff           = CL_GameVars + $27             ; $1327 - 
CL_KeyNew                   = CL_GameVars + $28             ; $1328 - 
CL_KeyNew_None                = $00                         ; 
CL_KeyOld                   = CL_GameVars + $29             ; $1329 - 
CL_TuneDeath                = CL_GameVars + $2a             ; $132a - 
CL_TuneDeath_None             = $00                         ; 
CL_TuneDeath_Step             = $04                         ; 
CL_TuneDeath_Ini              = $38                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
CL_Unused_132b              = CL_GameVars + $2b             ; $132b - 
; ------------------------------------------------------------------------------------------------------------- ;
CL_SpriteShow               = CL_GameVars + $2c             ; $132c - 
CL_SpriteShow_On              = $00                         ; 
CL_SpriteShow_Off             = $05                         ;         in edit mode
CL_CountIRQs                = CL_GameVars + $2d             ; $132d - 
CL_CountIRQs_Init             = $03                         ; 
CL_CountIRQs_Msg              = $4b                         ;         time for info message display
CL_TuneToPlayOff            = CL_GameVars + $2e             ; $132e - 
CL_TuneFreeBufferPosOff     = CL_GameVars + $2f             ; $132f - in buffers
; ------------------------------------------------------------------------------------------------------------- ;
CL_Unused_1330              = CL_GameVars + $30             ; $1330 - <not used>
; ------------------------------------------------------------------------------------------------------------- ;
CL_GoldJingleBeamLimit      = CL_GameVars + $31             ; $1331 - 
CL_JingleNum                = CL_GameVars + $32             ; $1332 - 
CL_JingleHeight             = CL_GameVars + $33             ; $1333 - 
CL_ScoreShown               = CL_GameVars + $34             ; $1334 - avoid score redisplay in score
CL_GoldJingleRndSeed        = CL_GameVars + $35             ; $1335 - 
CL_GoldJingleBeamPos        = CL_GameVars + $36             ; $1336 - 
CL_WaveVoice2               = CL_GameVars + $37             ; $1337 - 
CL_WaveVoice3               = CL_GameVars + $38             ; $1338 - 
CL_LodeRuShootMode          = CL_GameVars + $39             ; $1339 - 
CL_LodeRuShootMode_Back       = $00                         ;         shoot behind loadrunner
CL_LodeRuShootMode_Front      = $ff                         ;         shoot in front of loderunner
CL_DiskAction               = CL_GameVars + $3a             ; $133a - store read/write/init
CL_LevelReload              = CL_GameVars + $3b             ; $133b - level will be reloaded <> CL_LevelNoDisk
CL_LevelReload_Force          = $ff                         ;         force a level reload
; ------------------------------------------------------------------------------------------------------------- ;
; input buffer
; ------------------------------------------------------------------------------------------------------------- ;
CL_InputBufferPtr           = CL_GameVars + $3c             ; $133c - input biffer pointer
CL_InputBuffer              = CL_GameVars + $3d             ; $133d - the input buffer of $13 bytes
CL_InputBufferLen             = $13                         ;         input buffer size
                            
CL_SerialNum                = CL_InputBuffer                ; $133d - serial number input
CL_SerialNumDigit_01          = CL_SerialNum + $00          ; $133d - serial number 01
CL_SerialNumDigit_02          = CL_SerialNum + $01          ; $133e - serial number 02
CL_SerialNumDigit_03          = CL_SerialNum + $02          ; $133f - serial number 03
CL_SerialNumDigit_04          = CL_SerialNum + $03          ; $1340 - serial number 04
CL_SerialNumDigit_05          = CL_SerialNum + $04          ; $1341 - serial number 05
; ------------------------------------------------------------------------------------------------------------- ;
; $1342 - $1350 unused
; ------------------------------------------------------------------------------------------------------------- ;
CL_LevelNumDiskSave         = CL_GameVars + $51             ; $1351 - save CL_LevelNoDisk
CL_ScoreVersionId           = CL_GameVars + $52             ; $1352 - keeps the 1st char of id string dDANE BIGHAM
CL_ScoreVersionId_LR          = "D"                         ;         upper case - loderunner
CL_ScoreVersionId_CL          = "d"                         ;         lower case - championship loderunner
CL_Unused_1353              = CL_GameVars + $53             ; $1353 - not used but initialzed
CL_InputBufMaxLen           = CL_GameVars + $54             ; $1354 - 
CL_UniquePlayID             = CL_GameVars + $55             ; $1355 - unique playid
CL_ColorStatus              = CL_GameVars + $56             ; $1356 - new color for the status line
CL_ColorLevel               = CL_GameVars + $57             ; $1357 - new color for the level
CL_ScoreOffset              = CL_GameVars + $58             ; $1358 - 
CL_InputBufferCheck         = CL_GameVars + $59             ; $1359 - flag: check input type
CL_InputBufferCheck_Num       = %10000000                   ;         flag: check input number
CL_InputBufferCheck_Char      = %01000000                   ;         flag: check input char
CL_InputBufferCheck_Both      = %11000000                   ;         flag: check input char/number
CL_CheatMode                = CL_GameVars + $5a             ; $135a - allow extra lives/level forwarding
CL_CheatMode_Off              = $00                         ; 
CL_CheatMode_On               = $07                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; $135b - $13ae unused
; ------------------------------------------------------------------------------------------------------------- ;
CL_CheckSum                 = CL_GameVars + $af             ; $13af - protect copy protection
; ------------------------------------------------------------------------------------------------------------- ;
; Start Grafic - $13b0
; ------------------------------------------------------------------------------------------------------------- ;
CL_StartGfxData             = CL_MemStartGfxData            ; start gfx compressed input data
CL_StartGfxDataPtrOff_Lo      = $01                         ; offset to data pointer LO
CL_StartGfxDataPtrOff_Hi      = $02                         ; offset to data pointer HI
CL_StartGfxDataPtr_Len        = $02                         ; length of pointer pair
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Display Screen - $2000-$3fff
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScreenGfxDisplay         = CL_MemScreenGfxDisplay        ; 
CL_ScreenGfxDisplayEnd      = CL_ScreenGfxDisplay   + $1fff ; end of gfx screen display
; ------------------------------------------------------------------------------------------------------------- ;
; Status Separator Row in Hires Display Screen
; ------------------------------------------------------------------------------------------------------------- ;
CL_StatusRowNumber          = CL_ScreenRows_Max + $01       ; directly beyond max screen row
; ------------------------------------------------------------------------------------------------------------- ;
CL_StatusRowSepDisp         = CL_ScreenGfxDisplay   + $1b90 ; 
CL_StatusRowSepDisp_Le_00     = CL_StatusRowSepDisp + $0000 ; left start
CL_StatusRowSepDisp_Le_01     = CL_StatusRowSepDisp + $0001 ; 
CL_StatusRowSepDisp_Le_02     = CL_StatusRowSepDisp + $0002 ; 
CL_StatusRowSepDisp_Le_03     = CL_StatusRowSepDisp + $0003 ; 
                                  
CL_StatusRowSepDisp_Mi_00     = CL_StatusRowSepDisp + $0008 ; middle part
                                  
CL_StatusRowSepDisp_Ri_00     = CL_StatusRowSepDisp + $0118 ; right end
CL_StatusRowSepDisp_Ri_01     = CL_StatusRowSepDisp + $0119 ; 
CL_StatusRowSepDisp_Ri_02     = CL_StatusRowSepDisp + $011a ; 
CL_StatusRowSepDisp_Ri_03     = CL_StatusRowSepDisp + $011b ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Prepare Screen - $4000-$5fff
; ------------------------------------------------------------------------------------------------------------- ;
CL_ScreenGfxPrepare         = CL_MemScreenGfxPrepare        ; 
CL_ScreenGfxPrepareEnd      = CL_ScreenGfxPrepare   + $1fff ; end of gfx prepare area
; ------------------------------------------------------------------------------------------------------------- ;
; Status Separator Row in Hires Preparation Screen
; ------------------------------------------------------------------------------------------------------------- ;
CL_StatusRowSepPrep         = CL_ScreenGfxPrepare   + $1b90 ; left start
CL_StatusRowSepPrep_Le_00     = CL_StatusRowSepPrep + $0000 ; 
CL_StatusRowSepPrep_Le_01     = CL_StatusRowSepPrep + $0001 ; 
CL_StatusRowSepPrep_Le_02     = CL_StatusRowSepPrep + $0002 ; 
CL_StatusRowSepPrep_Le_03     = CL_StatusRowSepPrep + $0003 ; 
                                  
CL_StatusRowSepPrep_Mi_00     = CL_StatusRowSepPrep + $0008 ; middle part
                                  
CL_StatusRowSepPrep_Ri_00     = CL_StatusRowSepPrep + $0118 ; right end
CL_StatusRowSepPrep_Ri_01     = CL_StatusRowSepPrep + $0119 ; 
CL_StatusRowSepPrep_Ri_02     = CL_StatusRowSepPrep + $011a ; 
CL_StatusRowSepPrep_Ri_03     = CL_StatusRowSepPrep + $011b ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Jingle Data Areas - $c000/$c100/$c200/$c300
; ------------------------------------------------------------------------------------------------------------- ;
CL_TunePlayTime             = CL_MemTunePlayTime            ; tune times
CL_TuneDataPtrVoice2        = CL_MemTuneDataPtrVoice2       ; tune data pointer voice 2
CL_TuneDataPtrVoice3        = CL_MemTuneDataPtrVoice3       ; tune data pointer voice 3
CL_TuneSuReVol              = CL_MemTuneSuReVol             ; tune s/r/volume
; ------------------------------------------------------------------------------------------------------------- ;
; score working buffer - $c800/$c900
; ------------------------------------------------------------------------------------------------------------- ;
CL_BufScoreWork             = CL_MemBufScoreWork            ; 
CL_BufScoreWorkNew          = CL_MemBufScoreWorkNew         ; 
; ------------------------------------------------------------------------------------------------------------- ;
