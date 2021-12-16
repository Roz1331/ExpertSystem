; Этот блок реализует логику обмена информацией с графической оболочкой,
; а также механизм остановки и повторного пуска машины вывода
; Русский текст в комментариях разрешён!
(deftemplate ioproxy		; шаблон факта-посредника для обмена информацией с GUI
	(slot fact-id)		; теоретически тут id факта для изменения
	(multislot answers)	; возможные ответы
	(multislot messages)	; исходящие сообщения
	(slot reaction)		; возможные ответы пользователя
	(slot value)		; выбор пользователя
	(slot restore)		; забыл зачем это поле
)

; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112)	; это поле пока что не задействовано
		(value none)	; значение пустое
		(messages)	; мультислот messages изначально пуст
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
	(printout t "Message set : " ?new-msg " ... halting ... " crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule append-output-and-halt
	(declare (salience 99))
	?current-message <- (appendmessagehalt $?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Messages appended : " $?new-msg " ... halting ... " crlf) 
	(modify ?proxy (messages $?msg-list $?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule set-output-and-proceed
	(declare (salience 99))
	?current-message <- (sendmessage ?new-msg)
	?proxy <- (ioproxy)
	=>
	(printout t "Message set : " ?new-msg " ... proceed ... " crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
)

(defrule append-output-and-proceed
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... proceed ... " crlf)
	(modify ?proxy (messages $?msg-list ?new-msg))
	(retract ?current-message)
)

;======================================================================================


(defrule greeting
	(declare (salience 100))
	=>
	(assert (appendmessagehalt "Внимание! Чрезмерное употребление алкоголя вредит вашему здоровью! Зато как приятно вредит..."))
)

(deftemplate barParam 
	(slot param)
	(slot confidence)
)

(defrule Нормуль_не_нормуль
	(declare (salience 10))
	=>
	(assert (appendmessagehalt "ну_вот_и_все"))
)

(defrule Финиш
	(declare (salience 80))
	(barParam (param Классно_здорово_суперски))
	=>
	(assert (barParam (param Бары_подобраны)))
	(assert (appendmessagehalt "Классно_здорово_суперски -> Бары_подобраны"))
)

(defrule Нефиниш
	(declare (salience 80))
	(barParam (param Неклассно_нездорово_несуперски))
	=>
	(assert (barParam (param Что-то_пошло_не_так)))
	(assert (appendmessagehalt "Неклассно_нездорово_несуперски -> Что-то_пошло_не_так"))
)

(defrule merge_barParam
	(declare (salience 98))
	?n1<-(barParam (param ?param1) (confidence ?с1))
	?n2<-(barParam (param ?param2) (confidence ?с2))
	(test (= 0 (str-compare ?param1 ?param2)))
	(test (<> ?с1 ?с2))
	=>
	(modify ?n1 (confidence (* (+ ?с1 ?с2) 0.5)))
	(retract ?n2)
	(assert (appendmessagehalt (str-cat ?param1" (" ?с1 ", " ?с2 ") => " (- (+ ?с1 ?с2) (* ?с1 ?с2)))))
)

;======================================================================================

