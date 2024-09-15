//This tool can be used understand and figure out the various version numbers in Delphi
//It needs to be adapted for every new Delphi/RAD Studio release.
//Certain values need to be entered manually (Build No, Code Name, etc) others are determined automatically

program VersionInfo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TExtendedHelper = record helper for Extended
    function ToVersionString: string;
  end;

  { TExtendedHelper }
function TExtendedHelper.ToVersionString: string;
begin
  var LFormatsettings := TFormatSettings.Create('en-us');
  result := FormatFloat('0.0', self, LFormatsettings);
end;

begin
  try
    var LMainVersion := 0.0;
    var LCompilerVersion := CompilerVersion;
    var LConditionalVersion := 'unknown';
    var LRTLVersionXXX := 'unknown';
    var LCodeName := 'unknown';
    var LBuildNo := 'unknown';
    var LProjectVersion := 0.0;
    var LRegPath := '\Software\Embarcadero\BDS\';

    // -- D12
{$IFDEF VER360}
    LConditionalVersion := 'VER360';
    LCodeName := 'Athens';
    var LInternalVersion := 23.0;
{$ENDIF}
{$IF RTLVersion120}
    LMainVersion := 12.0;
    LRTLVersionXXX := 'RTLVersion120';
    LBuildNo := '29.0.50491.5718';
{$ENDIF}
{$IF RTLVersion121}
    LMainVersion := 12.1;
    LRTLVersionXXX := 'RTLVersion121';
    LBuildNo := '29.0.51961.7529';
    LProjectVersion := 20.1;
{$ENDIF}
{$IF RTLVersion122}
    LMainVersion := 12.2;
    LRTLVersionXXX := 'RTLVersion122';
    LBuildNo := '29.0.53571.9782';
    LProjectVersion := 20.2;
{$ENDIF}

    // -- D13
    //TBD
    //--

    var LRTLVersion := RTLVersion;
    var LProductVersion := LBuildNo.Split(['.'])[0].ToInteger;
    var LPackageversion := LProductVersion * 10;

    Writeln('Main Version: ' + LMainVersion.ToVersionString);
    Writeln('Code Name: ' + LCodeName);
    Writeln('Conditional : ' + LConditionalVersion);
    Writeln('Product Version : ' + LProductVersion.ToString);
    Writeln('Build No. : ' + LBuildNo);
    Writeln('Package Version : ' + LPackageversion.ToString);
    Writeln('Compiler Version: ' + LCompilerVersion.ToVersionString);
    Writeln('RTLVersionXXX : ' + LRTLVersionXXX);
    Writeln('RTLVersion : ' + LRTLVersion.ToVersionString);
    Writeln('Internal Version : ' + LInternalVersion.ToVersionString);
    Writeln('Project Version: ' + LProjectVersion.ToVersionString);
    Writeln('Registry Path :' + LRegPath + LInternalVersion.ToVersionString);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
