TYPE msg
    code AS LONG
    name AS STRING
END TYPE

DIM wm_messages(1000) AS msg

OPEN "wm_messages.txt" FOR INPUT AS #1
FOR i = 1 TO 1000
    INPUT #1, wm_messages(i).code, wm_messages(i).name
NEXT
CLOSE #1

_ACCEPTFILEDROP
DO
    e = _WINDOWSEVENT
    IF e <> prevE THEN
        prevE = e
        PRINT TIME$, e,
        FOR i = 1 TO 1000
            IF wm_messages(i).code = e THEN
                PRINT wm_messages(i).name
                EXIT FOR
            END IF
        NEXT
        IF i = 1001 THEN PRINT
    END IF
    _LIMIT 30
LOOP


