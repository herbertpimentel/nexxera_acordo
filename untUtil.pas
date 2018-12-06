unit untUtil;

interface

    function iif(test:boolean ; valtrue: string; valfalse: string): string;
    function StringLeftPad(const aString:string; aCharCount:integer; aChar:char): string;
    function StringRightPad(const aString:string; aCharCount:integer; aChar:char): string;

implementation

    function iif(test:boolean ; valtrue: string; valfalse: string): string;
    begin
        if (test) then Result := valtrue else Result := valfalse;
    end;


    function StringLeftPad(const aString:string; aCharCount:integer; aChar:char): string;
    begin
        Result := StringOfChar(aChar, aCharCount-length(aString))+aString;
    end;

    function StringRightPad(const aString:string; aCharCount:integer; aChar:char): string;
    begin
        Result := aString + StringOfChar(aChar, aCharCount-length(aString));
    end;
end.
