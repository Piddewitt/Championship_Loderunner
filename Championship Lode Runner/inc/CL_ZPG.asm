; --------------------------------------------------------------------------------------------------------------------- ;
; Championship Lode Runner - Zero Page Equates
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_LodeRuCol               = $03                           ;       loderunner actual col on level ctrl data
CLZ_LodeRuRow               = $04                           ;       loderunner actual row on level ctrl data
CLZ_LodeRuOnImgPosX         = $05                           ;       loderunner pos on image left/right
CLZ_LodeRuOnImgPosX_Min       = $00                         ; 
CLZ_LodeRuOnImgPosX_Mid       = $02                         ;       loderunner pos on image left/right - $02=center
CLZ_LodeRuOnImgPosX_Max       = $04                         ; 
CLZ_LodeRuOnImgPosY         = $06                           ;       loderunner pos on image up/down
CLZ_LodeRuOnImgPosY_Min       = $00                         ; 
CLZ_LodeRuOnImgPosY_Mid       = $02                         ;       loderunner pos on image up/down    - $02=center
CLZ_LodeRuOnImgPosY_Max       = $04                         ; 
CLZ_LodeRuSprtNum           = $07                           ;       loderunner sprite number
CLZ_LodeRuSprtNumRunLe_00     = $00                         ;       run    left 01
CLZ_LodeRuSprtNumRunLe_01     = $01                         ;       run    left 02
CLZ_LodeRuSprtNumRunLe_02     = $02                         ;       run    left 03
CLZ_LodeRuSprtNumPoleLe_00    = $03                         ;       pole   left 01
CLZ_LodeRuSprtNumPoleLe_01    = $04                         ;       pole   left 02
CLZ_LodeRuSprtNumPoleLe_02    = $05                         ;       pole   left 03
CLZ_LodeRuSprtNumShootLe      = $06                         ;       fire   left
CLZ_LodeRuSprtNumFallLe       = $07                         ;       fall   left
CLZ_LodeRuSprtNumRunRi_00     = $08                         ;       run    right 01
CLZ_LodeRuSprtNumRunRi_01     = $09                         ;       run    right 02
CLZ_LodeRuSprtNumRunRi_02     = $0a                         ;       run    right 03
CLZ_LodeRuSprtNumPoleRi_00    = $0b                         ;       pole   right 01
CLZ_LodeRuSprtNumPoleRi_01    = $0c                         ;       pole   right 02
CLZ_LodeRuSprtNumPoleRi_02    = $0d                         ;       pole   right 03
CLZ_LodeRuSprtNumShootRi      = $0e                         ;       fire   right
CLZ_LodeRuSprtNumFallRi       = $0f                         ;       fall   right
CLZ_LodeRuSprtNumLadder_00    = $10                         ;       ladder up/down 01
CLZ_LodeRuSprtNumLadder_01    = $11                         ;       ladder up/down 02
CLZ_LodeRuShootMode         = $08                           ; 
CLZ_LodeRuShootMode_Back      = $01                         ;       loderunner shoots against view direction
CLZ_LodeRuShootMode_Front     = $ff                         ;       loderunner shoots in view direction
; --------------------------------------------------------------------------------------------------------------------- ;
; pointers
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_LevelDataGamePtrRow     = $09                           ; ptr:  expanded level data rows $0800-$09c3
CLZ_LevelDataGamePtrRow_Lo    = $09                         ;       in game modified with lr/enemy/hole tiles
CLZ_LevelDataGamePtrRow_Hi    = $0a                         ; 
                            
CLZ_LevelDataCtrlPtrRow     = $0b                           ; ptr:  expanded level data rows $0a00-$0bc3
CLZ_LevelDataCtrlPtrRow_Lo    = $0b                         ;       original level structure without lr/enemy/hole tiles
CLZ_LevelDataCtrlPtrRow_Hi    = $0c                         ; 
                            
CLZ_StartGfxDisplay         = $0d                           ; ptr:  start screen gfx ouput
CLZ_StartGfxDisplay_Lo        = $0d                         ; 
CLZ_StartGfxDisplay_Hi        = $0e                         ; 
                            
CLZ_ImageDataOffPtr         = $0d                           ; ptr:  image data offsets
CLZ_ImageDataOffPtr_Lo        = $0d                         ; 
CLZ_ImageDataOffPtr_Hi        = $0e                         ; 

CLZ_SignRowNumberTabPtr     = $0d                           ; ptr:  image game over singn data offsets
CLZ_SignRowNumberTabPtr_Lo    = $0d                         ; 
CLZ_SignRowNumberTabPtr_Hi    = $0e                         ; 

CLZ_ScreenGfxPtr            = $0f                           ; ptr:  copy graphic data start address
CLZ_ScreenGfxPtr_Lo           = $0f                         ; 
CLZ_ScreenGfxPtr_Hi           = $10                         ; 
                            
CLZ_ScreenGfxDisplayPtr     = $0f                           ; ptr:  hires display graphic prepare screen
CLZ_ScreenRowDisplayPtr_Lo    = $0f                         ; 
CLZ_ScreenRowDisplayPtr_Hi    = $10                         ; 
                            
CLZ_ScreenRowPreparePtr     = $11                           ; ptr:  hires display graphic display screen
CLZ_ScreenRowPreparePtr_Lo    = $11                         ; 
CLZ_ScreenRowPreparePtr_Hi    = $12                         ; 
                            
CLZ_InputTextOutPtr         = $13                           ; ptr:  to $00 delimited text output string
CLZ_InputTextOutPtr_Lo        = $13                         ; 
CLZ_InputTextOutPtr_Hi        = $14                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_EnemyCol                = $15                           ;       actual enemy col on level ctrl data
CLZ_EnemyRow                = $16                           ;       actual enemy row on level ctrl data
CLZ_EnemySprtNum            = $17                           ;       actual enemy sprite number
CLZ_EnemySprtNum_Run_Le_00    = $00                         ;       run    left 01
CLZ_EnemySprtNum_Run_Le_01    = $01                         ;       run    left 02
CLZ_EnemySprtNum_Run_Le_02    = $02                         ;       run    left 03
CLZ_EnemySprtNum_Pole_Le_00   = $03                         ;       pole   left 01
CLZ_EnemySprtNum_Pole_Le_01   = $04                         ;       pole   left 02
CLZ_EnemySprtNum_Pole_Le_02   = $05                         ;       pole   left 03
CLZ_EnemySprtNum_Fall_Le      = $06                         ;       fall   left
CLZ_EnemySprtNum_Run_Ri_00    = $07                         ;       run    right 01
CLZ_EnemySprtNum_Run_Ri_01    = $08                         ;       run    right 02
CLZ_EnemySprtNum_Run_Ri_02    = $09                         ;       run    right 03
CLZ_EnemySprtNum_Pole_Ri_00   = $0a                         ;       pole   right 01
CLZ_EnemySprtNum_Pole_Ri_01   = $0b                         ;       pole   right 02
CLZ_EnemySprtNum_Pole_Ri_02   = $0c                         ;       pole   right 03
CLZ_EnemySprtNum_Fall_Ri      = $0d                         ;       fall   right
CLZ_EnemySprtNum_Ladder_00    = $0e                         ;       ladder up/down 01
CLZ_EnemySprtNum_Ladder_01    = $0f                         ;       ladder up/down 02
CLZ_EnemyViewDir            = $18                           ;       actual enemy dir right/left  $ff=left  $01=right
CLZ_EnemyViewDir_None         = $00                         ; 
CLZ_EnemyViewDir_Ri           = $01                         ; 
CLZ_EnemyViewDir_Le           = $ff                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; if negative: enemy has gold       - timer is counted up   to $00
; if positive: enemy sits in a hole - timer is counted down to $00
; ------------------------------------------------------------------------------------------------------------- ;
CLZ_EnemyHoleGoldTime       = $19                           ;       time in hole / time carry gold
CLZ_EnemyHoleGoldTime_None    = $00                         ;       time in hole / time carry gold exhausted
CLZ_EnemyHoleGoldTime_Shake   = $0d                         ;       in hole time - start to shiver if lower
CLZ_EnemyHoleGoldTime_Shake_X = $07                         ;       in hole time - get out of hole if lower
CLZ_EnemyHoleGoldTime_Ini     = $ff                         ;       gold timer start value - randomized by LR_EnemyBirthCol
; ------------------------------------------------------------------------------------------------------------- ;
CLZ_EnemyOnImgPosX          = $1a                           ;       actual enemy pos on image left/right
CLZ_EnemyOnImgPosX_Min        = $00                         ; 
CLZ_EnemyOnImgPosX_Mid        = $02                         ;       enemy pos on image left/right - $02=center
CLZ_EnemyOnImgPosX_Max        = $04                         ; 
CLZ_EnemyOnImgPosY          = $1b                           ;       actual enemy pos on image up/down
CLZ_EnemyOnImgPosY_Min        = $00                         ; 
CLZ_EnemyOnImgPosY_Mid        = $02                         ;       enemy pos on image up/down - $02=center
CLZ_EnemyOnImgPosY_Max        = $04                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_SaveGameDataOff         = $1c                           ; 
CLZ_SaveGameDataNameLen     = $1d                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_WorkStartGfxDataCount   = $1e                           ; work: start grafic output data counter/offset
CLZ_WorkGameOverParmTabOff  = $1e                           ; work: offse game over sign row number parm table
CLZ_WorkJoystickMove        = $1e                           ; work: save CIA register value for joysick move checks
CLZ_WorkDiskRC              = $1e                           ; work: disk operation return code
CLZ_WorkEnemyParmSave       = $1e                           ; work: save enemy row/col for subtraction
CLZ_WorkLevelDataPartCtrl   = $1e                           ; work: flag left or right nibble disk data byte procecssing
CLZ_WorkTopMsgCheck         = $1e                           ; work: flag top scorer msg available
CLZ_WorkHiresRowStartAdr_Lo = $1e                           ; work: hires row address LO
CLZ_WorkHiresRowStartAdr_Hi = $1f                           ; work: hires row address HI
CLZ_WorkStartGfxData        = $1f                           ; work: start grafic output data byte
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_ScreenSpinColOff        = $20                           ;       game over sign column position
CLZ_ScreenSpinColOff_Left     = $70                         ;       game over sign start column
CLZ_ScreenGfxRowPosY        = $20                           ;       grafic screen row column offset
CLZ_EnemyMoveMaxRow         = $20                           ;       actual row for scan enemy move col max left/right
CLZ_WorkSpritePosX          = $21                           ; work: gfx screen PosX
CLZ_ImageHeight             = $22                           ;       image height
CLZ_ImageHeight_Max           = CL_ImageHeight              ;       $0b
CLZ_WorkScoreEntryLen       = $22                           ; work: score buffer entry length
CLZ_WorkKeyNew              = $23                           ; work: new input key check
CLZ_ImageNumber             = $23                           ;       image number $00-$67 ($66/$67 unnused)
CLZ_ImageNumber_Blank         = $00                  ;      ;       level tile
CLZ_ImageNumber_Level_Tiles   = $01                  ; -$09 ;       level tiles
CLZ_ImageNumber_Blank_Rev     = $0a                  ;      ;       reversed blank
CLZ_ImageNumber_Sprt_LodeRu   = $0b                  ; -$27 ;       loderunner sprites
CLZ_ImageNumber_Sprt_Enemy    = $28                  ; -$36 ;       enemy sprites
CLZ_ImageNumber_Hole_Close    = $37                  ; -$38 ;       close holes
CLZ_ImageNumber_Rebirth       = $39                  ; -$3a ;       enemy rebirth
CLZ_ImageNumber_Digit         = $3b                  ; -$44 ;       digits
CLZ_ImageNumber_Char          = $45                  ; -$5e ;       chars A-Z  
CLZ_ImageNumber_Char_Special  = $5f                  ; -$65 ;       chars special  > . ( ) / - <
CLZ_WorkImgOffsetPosX       = $23                           ; work: save immage offset
CLZ_ImageOutputScreen       = $24                           ;       target output screen $20=$2000 $40=$4000
CLZ_WorkChkDiskIdResult     = $25                           ; 
CLZ_GfxImageClearLeft       = $25                           ;       prepare screen image byte for insertion of the buffer image byte
CLZ_GfxImageClearRight      = $26                           ;       prepare screen image byte for insertion of the buffer image byte
CLZ_LodeRuEnemyCollision    = $27                           ;       loderunner-enemy sprite collision value
CLZ_ScoreBoardRank          = $28                           ; work: actual rank
CLZ_EnemyMoveColStart       = $28                           ;       fix enemy move start col
CLZ_ScoreBoardOff           = $29                           ; work: score board offset
CLZ_EnemyMoveRowStart       = $29                           ; work: fix enemy move start row
CLZ_EnemyMoveLodeRuColGap   = $2a                           ;       scan gap between enemy and loderunner if both are on same row
CLZ_EnemyMoveDir            = $2b                           ;       actual enemy move direction
CLZ_EnemyMoveDir_Ini          = $00                         ;       
CLZ_EnemyMoveDir_Le           = $01                         ;       left
CLZ_EnemyMoveDir_Up           = $02                         ;       up
CLZ_EnemyMoveDir_Ri           = $03                         ;       right
CLZ_EnemyMoveDir_Do           = $04                         ;       down
CLZ_EnemyMoveDistMin        = $2c                           ; work: enemy move target min distance
CLZ_EnemyMoveDistMin_Ini      = $ff                         ;       init to maximum
CLZ_EnemyMoveMaxCol_Le      = $2d                           ;       maximum move enemy left if no obstacles in the way
CLZ_EnemyMoveMaxCol_Ri      = $2e                           ;       maximum move enemy right if no obstacles in the way
CLZ_EnemyMoveScanRowMax     = $2f                           ; work: save max enemy move scan row found 
CLZ_SfxScoreSub             = $2f                           ;       add score tune subtraction value
CLZ_SfxScoreSub_Base          = $40                         ;       add score tune
CLZ_SfxScoreSub_Start         = CL_Score_FinishLevel / 100 - $01 ;  score sub start value - each dec scores 100 points
CLZ_EnemyMoveScanCol        = $30                           ;       enemy move scan row
CLZ_EnemyMoveScanRow        = $31                           ;       enemy move scan col
CLZ_EnemyMoveCycle          = $32                           ;       enemy move cycles tab
CLZ_EnemyMoveCycle_01         = $32                         ;       enemy move cycles tab value 1
CLZ_EnemyMoveCycle_02         = $33                         ;       enemy move cycles tab value 2
CLZ_EnemyMoveCycle_03         = $34                         ;       enemy move cycles tab value 3
CLZ_EnemyMoveCycleWork      = $35                           ;       enemy move work value
CLZ_EnemyMoveCycleOff       = $36                           ;       enemy move pointer actual cycles ($32-$34)
CLZ_EnemyMoveCycleOff_Min     = $00                         ; 
CLZ_EnemyMoveCycleOff_Max     = CLZ_EnemyMoveCycle_03 - CLZ_EnemyMoveCycle + $01 ; $03
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_Notused_37              = $37                           ; 
CLZ_Notused_38              = $38                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_WorkScoreNewEntryNum    = $39                           ; work: save number of new leaderboard entry
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_Notused_39              = $39                           ; 
CLZ_Notused_3a              = $3a                           ; 
CLZ_Notused_3b              = $3b                           ; 
CLZ_Notused_3c              = $3c                           ; 
CLZ_Notused_3d              = $3d                           ; 
CLZ_Notused_3e              = $3e                           ; 
CLZ_Notused_3f              = $3f                           ; 
CLZ_Notused_40              = $40                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_ScreenGfxPartPosY       = $41                           ;       image y-position part number  (bits 0-1 of CLZ_ScreenCol substitution)
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_Notused_42              = $42                           ; 
CLZ_Notused_43              = $43                           ;       
CLZ_Notused_44              = $44                           ;       
CLZ_Notused_45              = $45                           ;       
CLZ_Notused_46              = $46                           ;       
CLZ_Notused_47              = $47                           ; 
CLZ_Notused_48              = $48                           ; 
CLZ_Notused_49              = $49                           ; 
CLZ_Notused_4a              = $4a                           ; 
CLZ_Notused_4b              = $4b                           ; 
CLZ_Notused_4c              = $4c                           ; 
CLZ_Notused_4d              = $4d                           ; 
CLZ_Notused_4e              = $4e                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_ScreenCol               = $4f                           ;       screen col  (00-1b)
CLZ_ScreenCol_Min             = $00                         ; 
CLZ_ScreenCol_Status_Score    = $05                         ;       column offset for score output in status line
CLZ_ScreenCol_Status_Lives    = $10                         ;       column offset for lives output in status line
CLZ_ScreenCol_Status_Level    = $19                         ;       column offset for level output in status line
CLZ_ScreenCol_Max             = $1b                         ; 
CLZ_ScreenRow               = $50                           ;       screen row  (00-0f)
CLZ_ScreenRow_Min             = $00                         ; 
CLZ_ScreenRow_Max             = $0f                         ; 
CLZ_ScreenRow_Status          = $10                         ;       status row number
CLZ_ScreenRow_Spin            = $50                         ;       screen row game over sign
CLZ_WaitForDemoCounter      = $50                           ;       wait for demo counter
CLZ_TargetGfxOutput         = $51                           ;       target output indicator -  $20=$2000 $40=$4000
CLZ_HoleOpenTimeTabOff      = $52                           ;       offset open hole time table
CLZ_LevelDiskDataOff        = $53                           ;       offset into packed level data loaded from disk
CLZ_ShootStepCtrl           = $54                           ;       loderunner shoot step image table offset
CLZ_ShootStepCtrl_Switch_Le   = $06                         ;       
CLZ_ShootStepCtrl_Switch_Ri   = $12                         ;       
CLZ_DemoMoveDataPtr         = $55                           ; ptr:  Demo move data table
CLZ_DemoMoveDataPtr_Lo        = $55                         ; 
CLZ_DemoMoveDataPtr_Hi        = $56                         ; 
CLZ_DemoMoveType            = $57                           ;       type of demo move (l/r/u/d/fire)
CLZ_DemoMoveDuration        = $58                           ;       duration demo move
CLZ_DemoNoFunction          = $59                           ; flag: used but has no function
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_Notused_5a              = $5a                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
; image buffer containinh the generated image bytes
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_ImageBuffer             = $5b                           ; buf:  generated image bytes - $5b-$7b
CLZ_ImageBuffer_Len           = CL_ImageHeight * $03        ;       image buffer length ($03 bytes for each $0b image row)
CLZ_ImageBufferRowPos_01      = $5b                         ; 
CLZ_ImageBufferRowPos_02      = $5c                         ; 
CLZ_ImageBufferRowPos_03      = $5d                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
CLZ_TuneValueVoice_01       = $7c                           ;       tune value voice 1
CLZ_JingleDataPtr           = $7d                           ; ptr:  jingle Data
CLZ_JingleDataPtr_Lo          = $7d                         ; 
CLZ_JingleDataPtr_Hi          = $7e                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
