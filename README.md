# Delphi-Version-Information

Delphi has several variables, symbols and other means where it stores its own version information. Here is a reference, trying to display as much information as possible. 

If you have corrections, additional information or updates, then feel free to post pull-requests.

As base I used the information provided in Embarcadero's DocWiki:
http://docwiki.embarcadero.com/RADStudio/en/Compiler_Versions





### Notes

- CompilerVersion was first introduced with Delphi 6, so earlier versions do not have the CompilerVersion constant
- Delphi 2007 defines two VERxxx symbols (VER180 and VER185). Delphi 2006 and 2007 are binary compatible, so 180 works for both. If you need only 2007, use VER185

### Credits

https://delphi.fandom.com/wiki/CompilerVersion_Constant

https://gist.github.com/jpluimers/b8c6b3bf29dbbf98a801f01beb8284a5

https://gist.github.com/menjaraz/f8b79e3329fed0da1b0d6bcaa54866d7

