
; https://autohotkey.com/board/topic/33506-read-ini-file-in-one-go/

WriteIni( filename = 0 )
; updates a whole .ini file 
; %Section%%Key% = %value%
{
Local s, c, p, key, k, write

   if not filename
      filename := SubStr( A_ScriptName, 1, -3 ) . "ini"

   FileRead, s, %filename%

   Loop, Parse, s, `n`r, %A_Space%%A_Tab%
   {
      c := SubStr(A_LoopField, 1, 1)
      if (c="[")
         key := SubStr(A_LoopField, 2, -1)
      else if (c=";")
         continue
      else {
         p := InStr(A_LoopField, "=")
         if p {
            k := SubStr(A_LoopField, 1, p-1)
	    write := %key%%k%
	    IniWrite, %write%, %filename%, %key%, %k% 
         }
      }
   }
}