unit Stats;

interface
const
  FILE_NAME = 'marksheet.csv';
  PASSMARK = 40;
var
  intCurrentScore, intMales, intFemales, intMalePasses, intFemalePasses,
  lineNumber, errorId, intCount: integer;
  strCurrentScore, strMalePassRate, strFemalePassRate: string;
  charCurrentGender: char;
  rMalePassRate, rFemalePassRate: real;
  Results: Text;

procedure CalcStats(FileName: string);

implementation
uses
  SysUtils, StrUtils;

procedure printError;
begin
  case errorId of
    1: Write('Файл не найден');
    2: Write('Файл пуст');
    3: Write('Нарушена структура данных');
    4: Write('Неверно указан пол');
    5: Write('Указанная оценка не является числом');
    6: Write('Указанная оценка вне диапазона');
    else
      Write('Неизвестная ошибка');
  end;
  if lineNumber <> 0 then
    writeln(' в строке ', lineNumber)
  else
    writeln;
  writeln(Results, 'error' + ',' + intToStr(errorId));
end;

procedure CalcStats(FileName: string);
var
  Marks: Text;
  strCurrentLine: string;
  ErrorCode, positionOfSeparator: integer;
begin
  lineNumber := 0;
  errorId := 0;

  assignFile(Results, 'results.csv');
  rewrite(Results);

  //Если файла не существует
  if not fileExists(FileName) then
  begin
    errorId := 1;
    printError;
    closeFile(Results);
    exit;
  end;

  intMales := 0;
  intFemales := 0;
  intMalePasses := 0;
  intFemalePasses := 0;
  intCurrentScore := 0;
  assignFile(Marks, FileName);
  reset(Marks);

  //Если файл пуст
  if EOF(Marks) then
  begin
    errorId := 2;
    printError;
    closeFile(Results);
    exit;
  end;

  while not EOF(Marks) do
  begin
    readln(Marks, strCurrentLine);
    Inc(lineNumber);
    positionOfSeparator := pos(',', strCurrentLine);

    //Пропускаем пустые строки и строки, содержащие только запятую
    if (strCurrentLine = '') or (strCurrentLine = ',') then
    begin
      continue;
    end;

    //Если неправильный формат данных
    if (positionOfSeparator <> 2) and (strCurrentLine <> ',') then
    begin
      errorId := 3;
      printError;
      continue;
    end;

    charCurrentGender := leftstr(strCurrentLine, 1)[1];

    //Если неверно указан пол
    if (charCurrentGender <> 'M') and (charCurrentGender <> 'F') then
    begin
      errorId := 4;
      printError;
      continue;
    end;

    strCurrentScore := rightstr(strCurrentLine, length(strCurrentLine) - 2);
    val(strCurrentScore, intCurrentScore, ErrorCode);

    //Если нельзя привести последние символы к числовому виду
    if not (ErrorCode = 0) then
    begin
      errorId := 5;
      printError;
      continue;
    end;

    //Если число баллов вне диапазона от 0 до 100
    if (intCurrentScore < 0) or (intCurrentScore > 100) then
    begin
      errorId := 6;
      printError;
      continue;
    end;

    if charCurrentGender = 'M' then
    begin
      Inc(intMales);
      if intCurrentScore >= PASSMARK then
        Inc(intMalePasses);
    end
    else
    begin
      Inc(intFemales);
      if intCurrentScore >= PASSMARK then
        Inc(intFemalePasses);
    end;
  end;

  closeFile(Marks);

  if intMales = 0 then
  begin
    strMalePassRate := 'NoMales';
  end
  else
  begin
    rMalePassRate := intMalePasses * 100 / intMales;
    strMalePassRate := FloatToStrf(rMalePassRate, ffFixed, 6, 2);
  end;
  writeln('Male Pass Rate (%): ', strMalePassRate);

  if intFemales = 0 then
  begin
    strFemalePassRate := 'NoFemales';
  end
  else
  begin
    rFemalePassRate := intFemalePasses * 100 / intFemales;
    strFemalePassRate := FloatToStrf(rFemalePassRate, ffFixed, 6, 2);
  end;
  writeln('Female Pass Rate (%): ', strFemalePassRate);

  if errorId = 0 then
  begin
     writeln(Results, strMalePassRate + ',' + strFemalePassRate);
  end;
  closeFile(Results);
end;

end.
