REM errorcode401.blogspot.in
REM ########################
@echo off
color B
mode con: cols=51 lines=20
goto CHECKING


REM CREATE AREA
REM ########################################################################################################
:CREATE
cd /d D:\
IF EXIST FFData GOTO DELETE
goto UDNOTE

:DELETE
echo y| cacls FFData /T /P everyone:F
echo y| RD /s FFData
goto CREATE

:UDNOTE
cls
echo.
echo ----------------------------------------------------------------
echo                              Welcome
echo ----------------------------------------------------------------
echo.   
echo  Hello User,
echo.
echo           Welcome, you are first time Using FFLocker 1.0 So, you
echo  have to register. Before Start We will Take Some  Detail  (Like
echo  name, Pasword) from you. Please Just Answer our Few Question.
echo.
echo.
echo ----------------------------------------------------------------
pause
goto CNAME

:CNAME
md FFData
attrib FFData +s +h
echo y| cacls FFData /T /P everyone:N
cd /d D:\
cls
echo.
echo ----------------------------------------------------------------
echo                           User Detail
echo ----------------------------------------------------------------
echo.
echo What is your name?
set/P "name= >> "
IF "%name%"==""  goto CNAMEERROR
goto CPASS

:CNAMEERROR
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Sorry, You can't leave it Blank, Try again...
pause
goto CNAME

:CPASS
cls
echo.
echo ----------------------------------------------------------------
echo                           User Detail
echo ----------------------------------------------------------------
echo.
echo Enter your password.
set/p "pass=>> "
IF "%pass%"==""  goto CPASSERROR
goto CSQUE

:CPASSERROR
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Sorry, You can not leave it Blank, Try again...
PAUSE
GOTO CPASS


:CSQUE
cls
echo.
echo ----------------------------------------------------------------
echo                           User Detail
echo ----------------------------------------------------------------
echo.
echo [1] Who is your Best Friend?
echo [2] Who is your first Girlfriend/BoyFriend?
echo [3] Where you was born?
echo [4] Which food you like most?
echo.
CHOICE /C 1234 /M "Select your Security Question."
IF ERRORLEVEL 4 goto CSQUE4
IF ERRORLEVEL 3 goto CSQUE3
IF ERRORLEVEL 2 goto CSQUE2
IF ERRORLEVEL 1 goto CSQUE1


:CSQUE1
set sque=Who is your Best Friend?
goto CSANS

:CSQUE2
set sque=Who is your first Girlfriend/BoyFriend?
goto CSANS

:CSQUE3
set sque=Where you was born?
goto CSANS

:CSQUE4
set sque=Which food you like most?
goto CSANS


:CSANS
cls
echo.
echo ----------------------------------------------------------------
echo                           User Detail
echo ----------------------------------------------------------------
echo.
ECHO Enter your Answer of Security Question.
set/p "ans=>> "
IF "%ans%"==""  goto CSANSERROR
goto STROEDATACNF

:CSANSERROR
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Sorry, You can't leave it Blank, Try again..
pause
goto CSANS

:STROEDATACNF
cls
echo.
echo ----------------------------------------------------------------
echo                          Confirm Detail
echo ----------------------------------------------------------------
echo.
echo Hello, %name% Check you Detail and Remember it.
echo.
echo.   
echo      Name         : %name%
echo      Password     : %pass%
echo      Security Que : %sque%
echo      Answer       : %ans%
echo.
echo ----------------------------------------------------------------
echo.
CHOICE /C YN /M "_            Press Y to Confirm  "
IF ERRORLEVEL 2 goto CNAME
IF ERRORLEVEL 1 goto STOREDATA


:STOREDATA
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
echo %pass% > ffpass.txt
echo %ans% > ffsans.txt
echo %name% > ffname.txt
echo %sque% > ffsque.txt
set/p un=< ffname.txt
cd..
echo y| cacls FFData /T /P everyone:N
goto STOREDATAMSG

:STOREDATAMSG
cls
echo ----------------------------------------------------------------
echo  Hi, %un%
echo ----------------------------------------------------------------
echo.
echo.
echo.                         
echo               #######################################
echo          #   #                                       #
echo         #   #                                         #
echo        #    #        Your Data Saved Successfully..   #
echo  #    #     #                                         #
echo   #  #       #                                       #
echo    ##         #######################################
echo.
echo.
echo ----------------------------------------------------------------
pause
goto SELECT
REM ########################################################################################################



REM SELECT AREA
REM #########################################################################################################

:SELECT
cls
echo.
echo ----------------------------------------------------------------
echo  Welcome Screen
echo ----------------------------------------------------------------
echo.
echo [1] Login
echo [2] Forgot Password
echo [3] About Me
echo [4] Need Help
echo [5] Update FFLocker
echo [x] Exit
echo.
echo ----------------------------------------------------------------

CHOICE /C 12345X /M "Enter your Choice "
IF NOT EXIST "D:\FFData" goto DATANOTF
goto SELCHO

:SELCHO
IF ERRORLEVEL 6 goto CLOSE
IF ERRORLEVEL 5 goto UPFFL
IF ERRORLEVEL 4 goto HELP
IF ERRORLEVEL 3 goto AD
IF ERRORLEVEL 2 goto RESETPASS
IF ERRORLEVEL 1 goto LOGIN

:UPFFL
IF EXIST "C:\Program Files\Mozilla Firefox\firefox.exe" goto SELFIREFOX4
goto IE4

:SELFIREFOX4
start firefox.exe "http://errorcode401.blogspot.in/2013/06/update-fflocker.html"
goto SELECT

:IE4
start iexplore "http://errorcode401.blogspot.in/2013/06/update-fflocker.html"
goto SELECT


:DATANOTF
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Some Data has been Currupted, Sorry For Inconvience...
pause
goto CNAME

:LOGIN
echo ----------------------------------------------------------------
echo.
echo Enter your Password.
set/p "upass=>> "
IF "%upass%"=="" GOTO BPASS
goto CHECKPASS

:BPASS
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Oooppss wrong Password, Try Again..
pause
goto SELECT

:CHECKPASS
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
set/p cpass=<ffpass.txt
cd..
echo y| cacls FFData /T /P everyone:N
IF %cpass%==%upass% goto LOGINOK
goto LOGINERROR

:LOGINOK
goto USERAREA

:LOGINERROR
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Oooppss wrong Password, Try Again..
pause
GOTO SELECT

:RESETPASS
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
set/p que=<ffsque.txt
cd..
echo y| cacls FFData /T /P everyone:N
cls
echo.
echo ----------------------------------------------------------------
echo                          Forgot Password
echo ----------------------------------------------------------------
echo.
echo Answer your security question..
echo.
echo %que%
set/p "ans=>> "
IF "%ans%"=="" goto RESETPASSERROR
goto RESETPASSCHECK

:RESETPASSERROR
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Invalid ANswer, Try again..
pause
goto SELECT

:RESETPASSCHECK
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
set/p answer=<ffsans.txt
cd..
echo y| cacls FFData /T /P everyone:N
IF %ans%==%answer% goto RESTOREPASS
goto INVALIDANS

:INVALIDANS
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Invalid Answer, Try Again..
pause
goto SELECT

:RESTOREPASS
cls
echo.
echo ----------------------------------------------------------------
echo                          Reset Password
echo ----------------------------------------------------------------
echo.
echo Enter Your New Password.
set/p "newpass=>> "
IF "%newpass%"==""  goto BLANKPASS
goto RESTORE

:BLANKPASS
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Blank Password, Try Again..
pause
goto SELECT

:RESTORE
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
SET/P un=<ffname.txt
del ffpass.txt
echo %newpass% > ffpass.txt
cd..
echo y| cacls FFData /T /P everyone:N
cls
cls
echo ----------------------------------------------------------------
echo  Hi, %un%
echo ----------------------------------------------------------------
echo.
echo.
echo.                         
echo               #######################################
echo          #   #                                       #
echo         #   #                                         #
echo        #    #     Your Password Reset Successfully.   #
echo  #    #     #                                         #
echo   #  #       #                                       #
echo    ##         #######################################
echo.
echo.
echo ----------------------------------------------------------------
pause
goto SELECT

:AD
cls
echo.
echo ----------------------------------------------------------------
echo                       About FFLocker 1.0
echo ----------------------------------------------------------------
echo.
echo. 
echo               Version          : 1.0
echo               Developed by     : Attract Tech.
echo               Operating System : Windows
echo               Memory Required  : 60 KB (Maximum)
echo               Open Source      : Yes
echo.
echo ----------------------------------------------------------------
pause
goto SELECT

:HELP
cls
echo.
echo ----------------------------------------------------------------
echo                           Need Help?
echo ----------------------------------------------------------------
echo.
echo         If you wannn any help regarding Code or How to use? then
echo mail to the following  EmailID with  your name, college name and
echo Emailid. or you can visit our blog or facebok page. you will get
echo solution within short time.
echo.
echo.
echo             ########################################
echo            #                                        #
echo           #                                          #
echo          #    Email ID : attracttech@gmail.com        #
echo          #    Blog     : Errorcode401.blogspot.in     #
echo          #    FB page  : facebook.com/errorcode401    #
echo          #    Twitter  : twitter.com/errorcode401     #
echo          #                                            #
echo          ##############################################
echo.
echo.
echo ----------------------------------------------------------------
CHOICE /C YN /M "_              Do you want to visit our blog  "
IF ERRORLEVEL 2 goto SELECT
IF ERRORLEVEL 1 goto GOTOBLOG


:GOTOBLOG
IF EXIST "C:\Program Files\Mozilla Firefox\firefox.exe" goto SELFIREFOX
goto IE

:SELFIREFOX
start firefox.exe "http://errorcode401.blogspot.in"
goto SELECT

:IE
start iexplore "http://errorcode401.blogspot.in"
goto SELECT

REM #########################################################################################################


REM USER AREA
REM #########################################################################################################

:USERAREA
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
set/p un=< ffname.txt
cd..
echo y| cacls FFData /T /P everyone:N
cls
echo.
echo ----------------------------------------------------------------
echo  Hi, %un%
echo ----------------------------------------------------------------
echo.
echo [1] Lock File/Folder
echo [2] Unlock File/Folder
echo [3] Change Password
echo [4] Update Information
echo [5] Need Help
echo [6] Learn Batchfile Programming
echo [x] Exit
echo.
echo ----------------------------------------------------------------
echo.
CHOICE /C 123456X /M "Enter your Choice "
IF ERRORLEVEL 7 goto CLOSE
IF ERRORLEVEL 6 goto LBATCH
IF ERRORLEVEL 5 goto HELPME
IF ERRORLEVEL 4 goto UINFO
IF ERRORLEVEL 3 goto CHPASS
IF ERRORLEVEL 2 goto UNLOCKFF
IF ERRORLEVEL 1 goto LOCKFF

:LBATCH
cls
echo.
echo ----------------------------------------------------------------
echo                   Learn Batchfile Programming       
echo ----------------------------------------------------------------
echo.
echo         If you want to learn Batch file programming then Book by
echo Ankit fadia is good for you. Download it now.
echo.
echo ----------------------------------------------------------------
CHOICE /C YN /M "_              Do you want to DOWNLOAD "
IF ERRORLEVEL 2 goto USERAREA
IF ERRORLEVEL 1 goto DWLBATCH

:DWLBATCH
IF EXIST "C:\Program Files\Mozilla Firefox\firefox.exe" goto SELFIREFOX3
goto IE3

:SELFIREFOX3
start firefox.exe "http://errorcode401.blogspot.in/2013/06/batch-file-programming.html"
goto USERAREA

:IE3
start iexplore "http://errorcode401.blogspot.in/2013/06/batch-file-programming.html"
goto USERAREA

:HELPME
cls
echo.
echo ----------------------------------------------------------------
echo                           Need Help?
echo ----------------------------------------------------------------
echo.
echo         If you wannn any help regarding Code or How to use? then
echo mail to the following  EmailID with  your name, college name and
echo Emailid. or you can visit our blog or facebok page. you will get
echo solution within short time.
echo.
echo.
echo             ########################################
echo            #                                        #
echo           #                                          #
echo          #    Email ID : attracttech@gmail.com        #
echo          #    Blog     : Errorcode401.blogspot.in     #
echo          #    FB page  : facebook.com/errorcode401    #
echo          #    Twitter  : twitter.com/errorcode401     #
echo          #                                            #
echo          ##############################################
echo.
echo.
echo ----------------------------------------------------------------
CHOICE /C YN /M "_              Do you want to visit our blog  "
IF ERRORLEVEL 2 goto USERAREA
IF ERRORLEVEL 1 goto GOTOBLOG2


:GOTOBLOG2
IF EXIST "C:\Program Files\Mozilla Firefox\firefox.exe" goto SELFIREFOX2
goto IE2

:SELFIREFOX2
start firefox.exe "http://errorcode401.blogspot.in"
goto USERAREA

:IE2
start iexplore "http://errorcode401.blogspot.in"
goto USERAREA

:CHPASS
echo ----------------------------------------------------------------
echo.
echo Enter New your password.
set/p "npass=>> "
IF "%npass%"==""  goto CHPASSERROR
goto CHKPASS

:CHPASSERROR
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Oooppss wrong Password, Try Again..
pause
goto USERAREA

:CHKPASS
cd /d D:
echo y| cacls FFData /T /P everyone:F
cd FFData
del ffpass.txt
echo %npass% > ffpass.txt
cd..
echo y| cacls FFData /T /P everyone:N
cls
echo ----------------------------------------------------------------
echo  Hi, %un%
echo ----------------------------------------------------------------
echo.
echo.
echo.                         
echo               #######################################
echo          #   #                                       #
echo         #   #                                         #
echo        #    #     Your Password Changed Successfully. #
echo  #    #     #                                         #
echo   #  #       #                                       #
echo    ##         #######################################
echo.
echo.
echo ----------------------------------------------------------------
pause
goto USERAREA

:UINFO
cls
echo.
echo ----------------------------------------------------------------
echo                             Remember
echo ----------------------------------------------------------------
echo.
echo.        If you will Update your Information (Like Name, Security
echo   question,  Password) then you will lost your previously stored
echo   data. and after that you can only login with new Data.
echo.
echo ----------------------------------------------------------------
echo.
CHOICE /C YN /M "_                   Can I Proceed "
IF ERRORLEVEL 2 goto USERAREA
IF ERRORLEVEL 1 goto DELDATA

:DELDATA
cd /d D:
echo y| cacls FFData /T /P everyone:F
echo y| rd /s FFData
goto CNAME

GOTO USERAREA
REM #########################################################################################################


REM LOCK AREA
REM #########################################################################################################

:LOCKFF
CLS
echo ----------------------------------------------------------------
echo                           Instruction
echo ----------------------------------------------------------------
echo.
echo Hello, %un%
echo.
echo                         : File/Folder Name :
echo.       
echo       You can Lock your Folder or File. IF you want to Lock your
echo Folde then you have to just Enter Folder Name when it Require or
echo you can lock your  file, but you  have to specify  filename with
echo extension.  Suppose you  want to lock "note" file, which is text
echo file. Then you have to write,
echo.
echo                         note.txt
echo ----------------------------------------------------------------
echo.
echo                             : Path :
echo.
echo      You have to  Specify your  Foder/File's  Location by Enter
echo a path. Suppose you File/Folder is in "EDUFILE" folder which is
echo in "DATA" folder and your "DATA" Folder is in D: Drive Then you 
echo have to write,
echo.
echo                     D:\EDUFILE\DATA
echo ----------------------------------------------------------------
echo Note : 
echo You have to remember you File/Folder name and path to Unlock it.
echo ----------------------------------------------------------------
pause
goto LOCKFFNX

:LOCKFFNX
cls
echo.
echo ----------------------------------------------------------------
echo                           File/Folder
echo ----------------------------------------------------------------
echo.
echo [1] File
echo [2] Folder
echo.
echo ----------------------------------------------------------------
echo.
CHOICE /C 12 /M "What you want to Lock "
IF ERRORLEVEL 2 goto FOFFOLDER
IF ERRORLEVEL 1 goto FOFFILE

:FOFFOLDER
cls
echo.
echo ----------------------------------------------------------------
echo                         FOLDER LOCKER
echo ----------------------------------------------------------------
echo.
ECHO Enter Name OF your Folder.
set/p "foldname=>>
IF "%foldname%"=="" goto WRONGINPUT
goto FOLDGETDETAILPATH

:FOLDGETDETAILPATH
echo.
echo ----------------------------------------------------------------
echo.
echo Where it is in your System (Path)?
set/p "foldp=>> "
IF "%foldp%"=="" goto WRONGINPUT
goto LOCKFOLD

:LOCKFOLD
cd /d "%foldp%"
IF EXIST "%foldname%" goto FOLDLOCK
goto LOCKERROR

:FOLDLOCK
cd /d "%foldp%"
attrib "%foldname%" +s +h
echo y| cacls "%foldname%" /T /P everyone:N
cls
goto LOCKDONE

:FOFFILE
cls
echo.
echo ----------------------------------------------------------------
echo                          FILE LOCKER
echo ----------------------------------------------------------------
echo.
ECHO Enter Name OF your FIle with extention (like note.txt).
set/p "filename=>>
IF "%filename%"=="" goto WRONGINPUT
goto FILEGETDETAILPATH

:FILEGETDETAILPATH
echo.
echo ----------------------------------------------------------------
echo.
echo Where it is in your System(Path)?
set/p "filep=>> "
IF "%filep%"=="" goto WRONGINPUT
goto LOCKF


:LOCKF
cd /d "%filep%"
IF EXIST "%filename%" goto FLOCK
goto LOCKERROR

:FLOCK
cd /d "%filep%"
attrib "%filename%" +s +h
echo y| cacls "%filename%" /C /P everyone:R
cls
goto LOCKDONE

:LOCKERROR
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Ooooppsss, File/Folder name or Path Was Wrong.
echo Try Again..
echo.
pause
goto USERAREA

:LOCKDONE
echo.
echo ----------------------------------------------------------------
echo                              Done
echo ----------------------------------------------------------------
echo.
echo.
echo                             _####_
echo                            #      #
echo                           #        #
echo                           #        #
echo                           #        #
echo                         ##############
echo                        #              #
echo                        #              #
echo                        #      ##      #
echo                        #     ####     #
echo                        #     ####     #
echo                        #      ##      #
echo                        #      ##      #
echo                        ################
echo.
echo ----------------------------------------------------------------
echo.
ECHO File/Folder Locked Successfully..
PAUSE
GOTO USERAREA

:WRONGINPUT
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Wrong INPUT, Try Again..
pause
goto USERAREA

REM #########################################################################################################



REM UNLOCK AREA
REM #########################################################################################################

:UNLOCKFF
cls
echo.
echo ----------------------------------------------------------------
echo                           File/Folder
echo ----------------------------------------------------------------
echo.
echo.
echo [1] File
echo [2] Folder
echo.
echo ----------------------------------------------------------------
echo.
CHOICE /C 12 /M "What you want to UnLock "
IF ERRORLEVEL 2 goto UNFOFFOLDER
IF ERRORLEVEL 1 goto UNFOFFILE

:UNFOFFOLDER
cls
echo.
echo ----------------------------------------------------------------
echo                         FOLDER UNLOCKER
echo ----------------------------------------------------------------
echo.
ECHO Enter Name OF your Folder.
set/p "foldname=>>
IF "%foldname%"=="" goto UNWRONGINPUT
goto UNFOLDGETDETAILPATH

:UNFOLDGETDETAILPATH
echo.
echo ----------------------------------------------------------------
echo.
echo Where it is in your System(Path)?
set/p "foldp=>> "
IF "%foldp%"=="" goto UNWRONGINPUT
goto UNLOCKFOLD

:UNLOCKFOLD
cd /d "%foldp%"
IF EXIST "%foldname%" goto UNFOLDLOCK
goto UNLOCKERROR

:UNFOLDLOCK
cd /d "%foldp%"
echo y| cacls "%foldname%" /T /P everyone:F
attrib "%foldname%" -s -h
cls
goto UNLOCKDONE

:UNFOFFILE
cls
echo.
echo ----------------------------------------------------------------
echo                         FILE UNLOCKER
echo ----------------------------------------------------------------
echo.
ECHO Enter Name OF your FIle with extention (like note.txt).
set/p "filename=>>
IF "%filename%"=="" goto UNWRONGINPUT
goto UNFILEGETDETAILPATH

:UNFILEGETDETAILPATH
echo.
echo ----------------------------------------------------------------
echo.
echo Where it is in your System(Path)?
set/p "filep=>> "
IF "%filep%"=="" goto UNWRONGINPUT
goto UNLOCKF


:UNLOCKF
cd /d "%filep%"
IF EXIST "%filename%" goto UNFLOCK
goto UNLOCKERROR

:UNFLOCK
cd /d "%filep%"
echo y| cacls "%filename%" /C /P everyone:F
attrib "%filename%" -s -h
cls
goto UNLOCKDONE

:UNLOCKERROR
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Ooooppsss, File/Folder name or Path Was Wrong.
echo Try Again..
echo.
pause
goto USERAREA

:UNLOCKDONE
cls
echo.
echo ----------------------------------------------------------------
echo                              Done
echo ----------------------------------------------------------------
echo.
echo.                                 
echo                               ####
echo                               ###
echo                               ####
echo                               ##
echo                               ##
echo                               ##
echo                               ##
echo                               ##
echo                               ##
echo                             ##  ##
echo                            ##    ##
echo                            ##    ##
echo                             ##__##
echo                               ##                                 
echo.
echo -----------------------------------------------------------------
echo File/Folder UnLocked Successfully..
pause
goto USERAREA

:UNWRONGINPUT
cls
echo.
echo ----------------------------------------------------------------
echo                          Error Message
echo ----------------------------------------------------------------
echo.
echo Wrong INPUT, Try Again..
pause
goto USERAREA

REM #########################################################################################################

REM CLOSING AREA
REM #########################################################################################################
:CLOSE
mode con:cols=65 lines=35
CLS.
echo ----------------------------------------------------------------
echo                            Can I close?
echo ----------------------------------------------------------------
echo.
echo.
echo             #############################################  
echo             #                                           #
echo             #      Thanks for Using My Code..           #
echo             #                                           #
echo             #                                           #
echo             #                      : Mohit Vaghadiya    #
echo             #                                           #
echo             #############################################
echo.
echo -----------------------------------------------------------------
echo.
CHOICE /C YN /M "_              Are you sure you want to close "
IF ERRORLEVEL 2 goto SELECT
IF ERRORLEVEL 1 goto EXIT

:EXIT
cd..
ECHO y | CACLS FFData /T /P everyone:N
exit

REM #########################################################################################################



REM Window Design
REM #########################################################################################################

:LOADDESIGN
color B
mode con: cols=50 lines=28
set load=
set/a loadnum=0

:LOADING
title FFLocker Loading...
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                  FFLocker 1.0
echo -------------------------------------------------
echo.
echo                      _####_
echo                     #      #
echo                    #        #
echo                    #        #
echo                    #        #
echo                  ##############
echo                 #              #
echo                 #              #
echo                 #      ##      #
echo                 #     ####     #
echo                 #     ####     #
echo                 #      ##      #
echo                 #      ##      #
echo                 ################
echo.
echo -------------------------------------------------
echo.
echo          Code Is Loading...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto PROCEED
goto LOADING
  
:PROCEED
mode con:cols=65 lines=35 
title FFLocker 1.0
cls
cd /d D:
IF EXIST FFData goto NEXT1
goto CREATE
:NEXT1
echo y| cacls FFData /T /P everyone:F
cd FFData
IF EXIST ffpass.txt goto NEXT2
goto CREATE
:NEXT2
IF EXIST ffsans.txt goto NEXT3
goto CREATE
:NEXT3
IF EXIST ffsque.txt goto NEXT4
goto CREATE
:NEXT4
IF EXIST ffname.txt goto SELECT
goto CREATE

REM #########################################################################################################

REM Setup Checking
REM #########################################################################################################


:CHECKING
IF EXIST "D:\FFSetupDone" goto LOADDESIGN
goto SETUPNOW



REM CONF
REM ############################################################

:SETUPNOW
set dot=
set/a lnum=0
goto CONF1

:CONF1
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CONF1
goto CONFN2

:CONFN2
set dot=
set/a lnum=0
goto CONF2

:CONF2
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CONFN3
goto CONF2

:CONFN3
set dot=
set/a lnum=0
goto CONF3

:CONF3
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN1
goto CONF3

:CPYFN1
set dot=
set/a lnum=0
goto CPYF1

REM COPYF
REM ############################################################
:CPYF1
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN2
goto CPYF1

:CPYFN2
set dot=
set/a lnum=0
goto CPYF2

:CPYF2
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN3
goto CPYF2

:CPYFN3
set dot=
set/a lnum=0
goto CPYF3

:CPYF3
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN4
goto CPYF3

:CPYFN4
set dot=
set/a lnum=0
goto CPYF4

:CPYF4
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN5
goto CPYF4

:CPYFN5
set dot=
set/a lnum=0
goto CPYF5

:CPYF5
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto CPYFN6
goto CPYF5

:CPYFN6
set dot=
set/a lnum=0
goto CPYF6

:CPYF6
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN1
goto CPYF6

REM INSTALLATION
REM ############################################################

:INSN1
set dot=
set/a lnum=0
goto INS1

:INS1
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN2
goto INS1

:INSN2
set dot=
set/a lnum=0
goto INS2

:INS2
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN3
goto INS2

:INSN3
set dot=
set/a lnum=0
goto INS3

:INS3
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN4
goto INS3

:INSN4
set dot=
set/a lnum=0
goto INS4

:INS4
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN5
goto INS4

:INSN5
set dot=
set/a lnum=0
goto INS5

:INS5
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto INSN6
goto INS5

:INSN6
set dot=
set/a lnum=0
goto INS6

:INS6
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker%dot%
echo.        
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto FNSHN1
goto INS6

REM FINISH
REM ############################################################

:FNSHN1
set dot=
set/a lnum=0
goto FNSH1

:FNSH1
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker            [Done]
echo          Finishing Setup%dot%  
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto FNSHN2
goto FNSH1

:FNSHN2
set dot=
set/a lnum=0
goto FNSH2

:FNSH2
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker            [Done]
echo          Finishing Setup%dot%  
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto FNSHN3
goto FNSH2

:FNSHN3
set dot=
set/a lnum=0
goto FNSH3

:FNSH3
cls
set dot=%dot%. 
title Setup Loading...
echo --------------------------------------------------
echo             Installing FFLocker 1.0
echo --------------------------------------------------
echo.
echo.
echo          Checking System Configuration  [Done]
echo          Copying Important Files        [Done]
echo          Installing FFLocker            [Done]
echo          Finishing Setup%dot%  
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo --------------------------------------------------
echo           Setup will take few minuets
echo --------------------------------------------------
ping localhost -n 2 >nul
set/a lnum=%lnum% +1
if %lnum%==3 goto SETUPCOMP
goto FNSH3

REM SETUP COMPLETED
REM #####################################################

:SETUPCOMP
copy "FFLocker 1.0 - Win7.bat" D:\
attrib "D:\FFLocker 1.0 - Win7.bat" +s +h
type null >> "FFLocker 1.0.bat"
echo REM Executing Codes  >> "FFLocker 1.0.bat"
echo REM ############################ >> "FFLocker 1.0.bat"
echo @echo off >> "FFLocker 1.0.bat"
echo color B >> "FFLocker 1.0.bat"
echo mode con: cols=51 lines=15 >> "FFLocker 1.0.bat"
echo. >> "FFLocker 1.0.bat"
echo IF EXIST "D:\FFLocker 1.0 - Win7.bat" goto START >> "FFLocker 1.0.bat"
echo goto ERROR >> "FFLocker 1.0.bat"
echo.  >> "FFLocker 1.0.bat"
echo :ERROR >> "FFLocker 1.0.bat"
echo TITLE FFLocker 1.0 - Crashed >> "FFLocker 1.0.bat"
echo echo. >> "FFLocker 1.0.bat"
echo echo -------------------------------------------------- >> "FFLocker 1.0.bat"
echo echo                        Crashed >> "FFLocker 1.0.bat"
echo echo -------------------------------------------------- >> "FFLocker 1.0.bat"
echo echo. >> "FFLocker 1.0.bat"
echo echo Sorry, FFLocker 1.0 is Crashed.. >> "FFLocker 1.0.bat"
echo echo You can Dowload it again from the following blog. >> "FFLocker 1.0.bat"
echo echo. >> "FFLocker 1.0.bat"
echo echo             "errorcode401.blogspot.in" >> "FFLocker 1.0.bat"
echo echo. >> "FFLocker 1.0.bat"
echo echo -------------------------------------------------- >> "FFLocker 1.0.bat"
echo pause >> "FFLocker 1.0.bat"
echo goto EXIT >> "FFLocker 1.0.bat"
echo.  >> "FFLocker 1.0.bat"
echo :EXIT >> "FFLocker 1.0.bat"
echo exit >> "FFLocker 1.0.bat"
echo.  >> "FFLocker 1.0.bat"
echo :START >> "FFLocker 1.0.bat"
echo CALL "D:\FFLocker 1.0 - Win7.bat" >> "FFLocker 1.0.bat"
echo.  >> "FFLocker 1.0.bat"
echo REM ############################ >> "FFLocker 1.0.bat"
echo REM Developed By Attract Tech >> "FFLocker 1.0.bat"
md D:\FFSetupDone
attrib "D:\FFSetupDone" +s +h
echo y| cacls "D:\FFSetupDone" /T /P everyone:N
cls
echo --------------------------------------------------
echo                  Setup Completed
echo --------------------------------------------------
echo.  
echo                                   ##
echo                                  ##
echo                                 ##
echo                                ##
echo                               ##
echo                 ##           ##
echo                  ##         ## 
echo                   ##       ## 
echo                    ##     ##
echo                     ##   ##
echo                      ##### 
echo                       ###
echo.
echo --------------------------------------------------
echo Open Your Desktop and click on FFLocker 1.0
ping localhost -n 4 >nul
echo y| del "FFLocker Codes.rar"
echo y| del "FFLocker 1.0 - Win7.bat"
exit
REM ############################################################
