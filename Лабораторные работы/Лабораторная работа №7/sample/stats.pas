unit Stats;

interface
const
  PASSMARK = 40;
  ERROR_MESSAGES : array [0..6] of string = ('',
                                            'File not found',
                                            'File empty',
                                            'Comma should follow letter',
                                            'First letter must be M or F',
                                            'Mark must be between 0 and 100 inclusive',
                                            'An integer must be after the comma');

var
  intCurrentScore, intMales, intFemales, intMalePasses, intFemalePasses, intLine, intError, intCount : integer;
  strCurrentScore, strMalePassRate, strFemalepassRate : string;
  charCurrentGender : char;
  rMalePassRate, rFemalePassRate : real;
  ErrorFound : Boolean;

procedure CalcStats(strMarksFile : string);

implementation
uses
  SysUtils, StrUtils;

procedure CalcStats(strMarksFile : string);
var
  Marks, Results : Text;
  strCurrentLine :  string;
  CommaPos, ErrorCode : integer;

procedure OutPutError;
begin
  ErrorFound := True;
  write(ERROR_MESSAGES[intError]);
  writeln(Results, 'error' + ',' + intToStr(intError));
  if intLine = 0 then
    writeln
  else
    writeln(' at line ', intLine);
end;  //nested proc

begin
  intError := 0;
  intLine := 0;
  assignFile(Results, 'results.csv');
  rewrite(Results);

  if not fileExists(strMarksFile) then
    begin
      intError := 1;
      OutPutError;
    end
  else
    begin
      intMales := 0;
      intFemales := 0;
      intMalePasses :=0;
      intFemalepasses := 0;
      intCurrentScore := 0;
      ErrorFound := False;
      assignFile(Marks, strMarksFile);
      reset(Marks);
      if eof(Marks) then
        begin
          intError := 2;
          OutPutError;
        end
      else
        begin
          while not eof(Marks) do
            begin
              repeat
                readln(Marks, strCurrentLine);
                inc(intLine);
              until ((strCurrentLine <> ',') and (strCurrentLine <> ''))  or eof(Marks);
              //Blank line or comma may be at the end of the file
              if not ((strCurrentLine = '') or (strcurrentline = ',')) then
                begin
                  CommaPos := pos(',', strCurrentline);
                  if (CommaPos <> 2) then
                    begin
                      intError := 3;  //Comma should follow letter
                      OutPutError;
                    end
                  else
                    begin
                      charCurrentGender := LeftStr(strCurrentLine, 1)[1];
                      charCurrentGender :=  UpCase(charCurrentGender);
                      if not (charCurrentGender in ['M', 'F']) then
                        begin
                          intError := 4;
                          OutPutError;
                        end
                      else
                        begin
                          strCurrentScore := rightStr(strCurrentLine, length(strCurrentLine) - 2);
                          val(strCurrentScore, intCurrentScore, ErrorCode);
                          if not (ErrorCode = 0) then
                            begin
                              intError := 6;
                              OutPutError;
                            end
                          else
                            begin
                              if (intCurrentScore < 0) or (intCurrentScore > 100) then
                                begin
                                  intError := 5;
                                  OutPutError;
                                end
                              else  //no error detected
                                begin
                                  if charCurrentGender = 'M' then
                                    begin
                                      inc(intMales);
                                      if intCurrentscore >= PASSMARK then
                                        inc(intMalePasses);
                                    end
                                  else //females
                                    begin
                                      inc(intFemales);
                                      if intCurrentscore >= PASSMARK then
                                        inc(intFemalePasses);
                                    end;
                                end; //if (intCurrentScore < 0) or (intCurrentScore > 100)
                           end; //if not (ErrorCode = 0)
                        end; //if not (charCurrentGender in ['M', 'F'])
                    end; //if CommaPos <> 2
                end;//if strcurrentLine not a space or comma
          end; //while
        if not ErrorFound then
          begin
            if intMales = 0 then
              begin
                writeln('No males');
                strMalePassRate := 'NoMales';
              end
            else
              begin
                rMalePassRate := intMalePasses * 100 / intMales;
                strMalePassRate := FloatToStrf(rMalePassRate, ffFixed, 6, 2);
                writeln('Male Pass Rate (%): ', strMalePassRate);
              end;
            if intFemales = 0 then
              begin
                writeln('No females');
                strFemalePassRate := 'NoFemales';
              end
            else
              begin
                rFemalePassRate := intFemalePasses * 100 / intFemales;
                strFemalePassRate := FloatToStrf(rFemalePassRate, ffFixed, 6, 2);
                writeln('Female Pass Rate (%): ', strFemalePassRate);
              end;
            writeln(Results, strMalePassRate + ',' + strFemalePassRate);
          end; //if not ErrorFound
        end; //if eof(Marks)
    end; //if not fileExists(FileName)
  closeFile(Results);
  if fileExists(strMarksFile) then
    closeFile(Marks);
end;

end.
