;========================================================================
; Этот блок реализует логику обмена информацией с графической оболочкой,
; а также механизм остановки и повторного пуска машины вывода
; Русский текст в комментариях разрешён!

(deftemplate ioproxy  ; шаблон факта-посредника для обмена информацией с GUI
	(slot fact-id)        ; теоретически тут id факта для изменения
	(multislot answers)   ; возможные ответы
	(multislot messages)  ; исходящие сообщения
	(slot reaction)       ; возможные ответы пользователя
	(slot value)          ; выбор пользователя
	(slot restore)        ; забыл зачем это поле
)

; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112) ; это поле пока что не задействовано
		(value none)   ; значение пустое
		(messages)     ; мультислот messages изначально пуст
	)
)

(defrule clear-messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
	=>
	(modify ?proxy (messages))
	(retract ?clear-msg-flg)
	(printout t "Messages cleared ..." crlf)	
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule append-output-and-halt
	; Аналогичен предыдущему, но с добавлением сообщения, а не с заменой
	(declare (salience 99))
	?current-message <- (appendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule set-output-and-proceed
	(declare (salience 99))
	?current-message <- (sendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message))

(defrule append-output-and-proceed
	; По аналогии
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message))
)

;======================================================================================
(deftemplate barParam 
	(slot argument)
)

(defrule greeting
	(declare (salience 100))
	=>
	(assert (appendmessagehalt "Внимание! Чрезмерное употребление алкоголя вредит вашему здоровью! Зато как приятно вредит..."))
)

; r-1;fic-31 (Большая_компания);f-69 (Большой_бар);Для больших компаний - только большие бары

(defrule Для больших компаний - только большие бары
	(declare(salience 40))
	(barParam(argument Большая_компания))
	=>
	(assert(barParam(argument Большой_бар)))
	(assert(appendmessagehalt "Для больших компаний - только большие бары"))
)

(defrule complex-eye-hair-match 
	(declare (salience 40))
	?p1 <- (person (name ?name1) 
		(eyes ?eyes1)
		(age ?age1&:(< ?age1 30))
		(hair ?hair1)
	) 
	?p2 <-	(person (name ?name2&~?name1) 
		(eyes ?eyes2&~eyes1) 
		(age ?age2)
		(hair ?hair2&red|?hair1)
	)
	(test (< (abs (- ?age1 ?age2)) 10))
	;(test (< (fact-index ?p1) (fact-index ?p2)))
	=> 
	(assert (appendmessagehalt (str-cat "У нас есть пара! " ?name1 " и " ?name2)))
        ;(assert (appendmessagehalt "У нас есть пара!"))
)

(defrule match-pair-for-user 
	(declare (salience 10))
	=> 
	(assert (sendmessagehalt "Вам пары не досталось, но вы там держитесь!"))
) 