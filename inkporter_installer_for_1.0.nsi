; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Inkporter For Inkscape 1.0"
!define PRODUCT_VERSION "1.6.2"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
; !define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\AppMainExe.exe"

; Var InkCommand
; Function commandVar
  ; Var /GLOBAL Inkput
  ; StrCpy $InkCommand "$INSTDIR\inkporter_x.bat"
  ; StrCpy $Inkput "%1"
; FunctionEnd


Unicode true
SetCompressor /solid lzma
; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "inkporter.ico"
!define MUI_UNICON "inkporter.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
;!define MUI_FINISHPAGE_RUN "$INSTDIR\inkporter.bat"
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME}"
OutFile "${PRODUCT_NAME} Ver. ${PRODUCT_VERSION}.exe"
InstallDir "$APPDATA\Inkscape\extensions\"
;InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  ; File "c:\path\to\file\AppMainExe.exe"
  ; CreateDirectory "$SMPROGRAMS\Inkporter"
  ; CreateShortCut "$SMPROGRAMS\Inkporter\InkporterConfig (Beta).lnk" "$INSTDIR\inkporter_data\inkporter_config.bat"
  ; CreateShortCut "$SMPROGRAMS\Inkporter\Uninstall Inkporter.lnk" "$INSTDIR\inkporter_data\uninst.exe"
  File "1.0\Inkporter.py"
  File "1.0\Inkporter.inx"
  File "1.0\Inkporter.bat"
  File /r "1.0\Inkporter_data*"
  File "inkporter.ico"
  ; File "license.txt"
  ; File /r "inkporter\1.0*"
SectionEnd

  Section "setvar" SEC02
  ; Set to HKLM
  EnVar::SetHKLM

  ; ; Check for write access
  ; EnVar::Check "NULL" "NULL"
  ; Pop $0
  ; DetailPrint "EnVar::Check write access HKLM returned=|$0|"
  
  ; EnVar::AddValue "Path" "$INSTDIR\inkporter_data"
  ; Pop $0
  ; DetailPrint "EnVar::AddValue returned=|$0|"
  
  EnVar::AddValue "Path" "$INSTDIR"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"
  
  EnVar::AddValue "Path" "$PROGRAMFILES64\Inkscape\bin"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"
  
  EnVar::AddValue "Path" "$INSTDIR\inkporter_data\gs9.52\bin"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"
  
  EnVar::AddValue "Path" "$INSTDIR\inkporter_data\libwebp\bin"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"
  
  EnVar::AddValue "Path" "$INSTDIR\inkporter_data\7-Zip"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"

  
 SectionEnd

Section -Post
  WriteRegExpandStr HKCR "Directory\Background\shell\Inkporter" "" "Open Inkporter here"
  WriteRegExpandStr HKCR "Directory\Background\shell\Inkporter" "Icon" "$INSTDIR\inkporter_data\inkporter.ico"
  WriteRegExpandStr HKCR "Directory\Background\shell\Inkporter\command" "" "$INSTDIR\inkporter_data\inkporter.bat"
  WriteRegExpandStr HKCR "inkscape.svg\shell\Inkporter\command" "" '$INSTDIR\inkporter_data\inkporter.bat "%1"'
  WriteRegExpandStr HKCR "inkscape.svg\shell\Inkporter" "Icon" "$INSTDIR\inkporter_data\inkporter.ico"
  WriteRegExpandStr HKCR "inkscape.svg\shell\Inkporter" "" "Export with Inkporter"
  WriteUninstaller "$INSTDIR\uninstall_inkporter.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninstall_inkporter.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
SectionEnd


Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  SetShellVarContext current
  ; Delete "$INSTDIR\uninst.exe"
  ; Delete "$INSTDIR\license.txt"
  Delete "$INSTDIR\inkporter.ico"
  Delete "$INSTDIR\inkporter.bat"
  Delete "$INSTDIR\inkporter.py"
  Delete "$INSTDIR\inkporter.inx"
  RMDir /r "$INSTDIR\inkporter_data"
  
  ; Set to HKLM
  EnVar::SetHKLM

  ; Check for write access
  ; EnVar::Check "NULL" "NULL"
  ; Pop $0
  ; DetailPrint "EnVar::Check write access HKLM returned=|$0|"
  
  ; EnVar::DeleteValue "Path" "$INSTDIR\inkporter_data"
  ; Pop $0
  ; DetailPrint "EnVar::DeleteValue returned=|$0|"
  
  EnVar::DeleteValue "Path" "$INSTDIR"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  
  EnVar::DeleteValue "Path" "$PROGRAMFILES64\Inkscape\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  
  EnVar::DeleteValue "Path" "$INSTDIR\inkporter_data\gs9.52\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  
  EnVar::DeleteValue "Path" "$INSTDIR\inkporter_data\libwebp\bin"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"
  
  EnVar::DeleteValue "Path" "$INSTDIR\inkporter_data\7-Zip"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=|$0|"



  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKCR "Directory\Background\shell\Inkporter"
  DeleteRegKey HKCR "inkscape.svg\shell\Inkporter"
  SetAutoClose true
SectionEnd

Function un.onUninstSuccess
  HideWindow
  Delete "$INSTDIR\uninstall_inkporter.exe"
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd
