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
)

(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(param Большая_компания))
=>
(assert(barParam(param Большой_бар)))
(assert(appendmessagehalt "Для больших компаний - только большие бары")))

(defrule Маленькая_компания_может_пойти_в_большой_бар
(declare(salience 40))
(barParam(param Компания_до_4_человек))
=>
(assert(barParam(param Большой_бар)))
(assert(appendmessagehalt "Маленькая компания может пойти в большой бар")))

(defrule Маленькая_компания_поместится_в_бар_с_парой_больших_столов
(declare(salience 40))
(barParam(param Компания_до_4_человек))
=>
(assert(barParam(param Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Маленькая компания поместится в бар с парой больших столов")))

(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(param Большая_компания))
=>
(assert(barParam(param Большой_бар)))
(assert(appendmessagehalt "Для больших компаний - только большие бары")))

(defrule Вдвоём_можно_сходить_в_большой_бар
(declare(salience 40))
(barParam(param Вдвоем))
=>
(assert(barParam(param Большой_бар)))
(assert(appendmessagehalt "Вдвоём можно сходить в большой бар")))

(defrule Вдвоём_можно_сходить_и_в_средний_бар
(declare(salience 40))
(barParam(param Вдвоем))
=>
(assert(barParam(param Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Вдвоём можно сходить и в средний бар")))

(defrule Вдвоём_поместитесь_за_маленьким_столиком
(declare(salience 40))
(barParam(param Вдвоем))
=>
(assert(barParam(param Бар_только_с_маленькими_столиками)))
(assert(appendmessagehalt "Вдвоём поместитесь за маленьким столиком")))

(defrule Одному_можно_посидеть_за_барной_стойкой
(declare(salience 40))
(barParam(param В_одиночку))
=>
(assert(barParam(param Бар_без_столиков)))
(assert(appendmessagehalt "Одному можно посидеть за барной стойкой")))

(defrule Одному_можно_посидеть_за_столиком
(declare(salience 40))
(barParam(param В_одиночку))
=>
(assert(barParam(param Бар_только_с_маленькими_столиками)))
(assert(appendmessagehalt "Одному можно посидеть за столиком")))

(defrule Одному_можно_прийти_в_средний_бар
(declare(salience 40))
(barParam(param В_одиночку))
=>
(assert(barParam(param Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Одному можно прийти в средний бар")))

(defrule Одному_можно_найти_место_в_большом_баре
(declare(salience 40))
(barParam(param В_одиночку))
=>
(assert(barParam(param Большой_бар)))
(assert(appendmessagehalt "Одному можно найти место в большом баре")))

(defrule Если_сотка_в_кармане_-_иди_в_дешёвый_бар
(declare(salience 40))
(barParam(param Посидеть_на_сотку))
=>
(assert(barParam(param Дешёвый_бар)))
(assert(appendmessagehalt "Если сотка в кармане - иди в дешёвый бар")))

(defrule Если_у_тебя_есть_стипендия_-_купи_много_в_дешёвом_баре
(declare(salience 40))
(barParam(param Посидеть_на_стипендию))
=>
(assert(barParam(param Дешёвый_бар)))
(assert(appendmessagehalt "Если у тебя есть стипендия - купи много в дешёвом баре")))

(defrule Со_стипендией_можно_пойти_в_бар_со_средними_ценами
(declare(salience 40))
(barParam(param Посидеть_на_стипендию))
=>
(assert(barParam(param Бар_средней_ценовой_категории)))
(assert(appendmessagehalt "Со стипендией можно пойти в бар со средними ценами")))

(defrule Если_ты_с_зарплатой_-_купи_очень_много_в_дешёвом_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату))
=>
(assert(barParam(param Дешёвый_бар)))
(assert(appendmessagehalt "Если ты с зарплатой - купи очень много в дешёвом баре")))

(defrule Если_ты_с_зарплатой_-_иди_веселись_в_среднем_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату))
=>
(assert(barParam(param Бар_средней_ценовой_категории)))
(assert(appendmessagehalt "Если ты с зарплатой - иди веселись в среднем баре")))

(defrule С_зарплатой_и_с_QR_кодом_можно_шиковать_в_дорогом_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату))
(barParam(param Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(param Дорогой_бар)))
(assert(appendmessagehalt "С зарплатой и с QR кодом можно шиковать в дорогом баре")))

(defrule Лонг_дринки_-_легко
(declare(salience 40))
(barParam(param Коктейли))
=>
(assert(barParam(param Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Лонг дринки - легко")))

(defrule Пиво_-_легко
(declare(salience 40))
(barParam(param Пиво))
=>
(assert(barParam(param Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Пиво - легко")))

(defrule Сидр_-_легко
(declare(salience 40))
(barParam(param Cидр))
=>
(assert(barParam(param Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Сидр - легко")))

(defrule Вино_-_легко
(declare(salience 40))
(barParam(param Вино))
=>
(assert(barParam(param Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Вино - легко")))

(defrule Сидр_=>_сидрерия
(declare(salience 40))
(barParam(param Cидр))
=>
(assert(barParam(param Сидрерия)))
(assert(appendmessagehalt "Сидр => сидрерия")))

(defrule Сидр_=>_пивной_бар
(declare(salience 40))
(barParam(param Cидр))
=>
(assert(barParam(param Пивной_бар)))
(assert(appendmessagehalt "Сидр => пивной бар")))

(defrule Слабый_алкоголь_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(param Слабоалкогольные_напитки))
=>
(assert(barParam(param Бар_широкого_профиля)))
(assert(appendmessagehalt "Слабый алкоголь => бар широкого профиля")))

(defrule Вино_=>_винный_бар
(declare(salience 40))
(barParam(param Вино))
=>
(assert(barParam(param Винный_бар)))
(assert(appendmessagehalt "Вино => винный бар")))

(defrule Вино_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(param Вино))
=>
(assert(barParam(param Бар_широкого_профиля)))
(assert(appendmessagehalt "Вино => бар широкого профиля")))

(defrule Пиво_=>_пивбар
(declare(salience 40))
(barParam(param Пиво))
=>
(assert(barParam(param Пивной_бар)))
(assert(appendmessagehalt "Пиво => пивбар")))

(defrule Крепкие_напитки_=>_Бар_широкого_профиля
(declare(salience 40))
(barParam(param Крепкие_напитки))
=>
(assert(barParam(param Бар_широкого_профиля)))
(assert(appendmessagehalt "Крепкие напитки => Бар широкого профиля")))

(defrule Лонг_дринки_=>_Коктейльный_бар
(declare(salience 40))
(barParam(param Коктейли))
=>
(assert(barParam(param Коктейльный_бар)))
(assert(appendmessagehalt "Лонг дринки => Коктейльный бар")))

(defrule Есть_все_отрицания_фич_=>_нам_на_них_всё_равно
(declare(salience 40))
(barParam(param Настольный_футбол_не_обязателен))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
(barParam(param Кальян_не_обязателен))
(barParam(param Кухня_не_обязательна))
(barParam(param Устроят_обычные_официанты))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Кот_не_обязателен))
(barParam(param Нет_столиков_на_улице))
=>
(assert(barParam(param Не_выбрана_ни_одна_фича)))
(assert(appendmessagehalt "Есть все отрицания фич => нам на них всё равно")))

(defrule Мы_дошли_до_пивка_на_западном
(declare(salience 40))
(barParam(param Бар_Пив_ко))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пив_ко)))
(assert(appendmessagehalt "Мы дошли до пивка на западном")))

(defrule Мы_дошли_до_пивка_на_северном
(declare(salience 40))
(barParam(param Бар_Пив_ко))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пив_ко)))
(assert(appendmessagehalt "Мы дошли до пивка на северном")))

(defrule Мы_дошли_до_пивноff_на_западном
(declare(salience 40))
(barParam(param Бар_Пивноff))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на западном")))

(defrule Мы_дошли_до_пивноff_на_северном
(declare(salience 40))
(barParam(param Бар_Пивноff))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на северном")))

(defrule Мы_дошли_до_Есенина
(declare(salience 40))
(barParam(param Бар_Есенин))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Мы дошли до Есенина")))

(defrule Мы_дошли_до_O.W.Grant
(declare(salience 40))
(barParam(param Бар_O.W.Grant))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Мы дошли до O.W.Grant")))

(defrule Мы_дошли_до_Сияния
(declare(salience 40))
(barParam(param Бар_Сияние))
(barParam(param Располагается_в_центрe))
(barParam(param Винный_бар))
(barParam(param Дорогой_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Мы дошли до Сияния")))

(defrule Мы_дошли_до_Мистера_Fox
(declare(salience 40))
(barParam(param Бар_Мистер_Fox))
(barParam(param Располагается_в_центрe))
(barParam(param Сидрерия))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Мистер_Fox)))
(assert(appendmessagehalt "Мы дошли до Мистера Fox")))

(defrule Мы_дошли_до_Дров
(declare(salience 40))
(barParam(param Бар_Дрова))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы дошли до Дров")))

(defrule Мы_дошли_до_Hops
(declare(salience 40))
(barParam(param Бар_Hops))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Hops)))
(assert(appendmessagehalt "Мы дошли до Hops")))

(defrule Мы_дошли_до_Своего_бара
(declare(salience 40))
(barParam(param Бар_Свой_Бар))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Свой_Бар)))
(assert(appendmessagehalt "Мы дошли до Своего бара")))

(defrule Мы_дошли_до_Эйнштейна
(declare(salience 40))
(barParam(param Бар_Эйнштейн))
(barParam(param Располагается_на_западном))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Мы дошли до Эйнштейна")))

(defrule Мы_дошли_до_Пинты_на_западном
(declare(salience 40))
(barParam(param Бар_Пинта))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на западном")))

(defrule Мы_дошли_до_Пинты_на_северном
(declare(salience 40))
(barParam(param Бар_Пинта))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на северном")))

(defrule Мы_дошли_до_Пинты_в_центре
(declare(salience 40))
(barParam(param Бар_Пинта))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты в центре")))

(defrule Мы_дошли_до_Доброго_Эля_на_западном
(declare(salience 40))
(barParam(param Бар_Добрый_Эль))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на западном")))

(defrule Мы_дошли_до_Доброго_Эля_на_северном
(declare(salience 40))
(barParam(param Бар_Добрый_Эль))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на северном")))

(defrule Мы_дошли_до_Доброго_Эля_в_центре
(declare(salience 40))
(barParam(param Бар_Добрый_Эль))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля в центре")))

(defrule Мы_дошли_до_Немца_Перца_Колбасы
(declare(salience 40))
(barParam(param Бар_Немец_Перец_Колбаса))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы дошли до Немца Перца Колбасы")))

(defrule Мы_дошли_до_Голодранца
(declare(salience 40))
(barParam(param Бар_Голодранец))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Голодранец)))
(assert(appendmessagehalt "Мы дошли до Голодранца")))

(defrule Мы_дошли_до_1984
(declare(salience 40))
(barParam(param Бар_1984))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_1984)))
(assert(appendmessagehalt "Мы дошли до 1984")))

(defrule Мы_дошли_до_Квадрюпеля
(declare(salience 40))
(barParam(param Бар_Квадрюпель))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Мы дошли до Квадрюпеля")))

(defrule Мы_дошли_до_Красного_Крокодила
(declare(salience 40))
(barParam(param Бар_Красный_Крокодил))
(barParam(param Располагается_на_северном))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы дошли до Красного Крокодила")))

(defrule Мы_дошли_до_Шамайки
(declare(salience 40))
(barParam(param Бар_Шамайка))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Шамайка)))
(assert(appendmessagehalt "Мы дошли до Шамайки")))

(defrule Мы_дошли_до_Корриды
(declare(salience 40))
(barParam(param Бар_Коррида))
(barParam(param Располагается_на_северном))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Коррида)))
(assert(appendmessagehalt "Мы дошли до Корриды")))

(defrule Мы_дошли_до_London_Pub
(declare(salience 40))
(barParam(param Бар_London_Pub))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_London_Pub)))
(assert(appendmessagehalt "Мы дошли до London Pub")))

(defrule Мы_дошли_до_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Бар_St._Patrick’s_Pub))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Мы дошли до St. Patrick’s Pub")))

(defrule Мы_дошли_до_Mozart_Wine_House
(declare(salience 40))
(barParam(param Бар_Mozart_Wine_House))
(barParam(param Располагается_в_центрe))
(barParam(param Винный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Мы дошли до Mozart Wine House")))

(defrule Мы_дошли_до_Шкипера
(declare(salience 40))
(barParam(param Бар_Шкипер))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Шкипер)))
(assert(appendmessagehalt "Мы дошли до Шкипера")))

(defrule Мы_дошли_до_Mojo
(declare(salience 40))
(barParam(param Бар_Mojo))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Mojo)))
(assert(appendmessagehalt "Мы дошли до Mojo")))

(defrule Мы_дошли_до_Чёрного_кота
(declare(salience 40))
(barParam(param Бар_Чёрный_кот))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы дошли до Чёрного кота")))

(defrule Мы_дошли_до_пивка_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пив_ко)))
(assert(appendmessagehalt "Мы дошли до пивка на западном")))

(defrule Мы_дошли_до_пивка_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пив_ко)))
(assert(appendmessagehalt "Мы дошли до пивка на северном")))

(defrule Мы_дошли_до_пивноff_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на западном")))

(defrule Мы_дошли_до_пивноff_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на северном")))

(defrule Мы_дошли_до_Есенина
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Мы дошли до Есенина")))

(defrule Мы_дошли_до_O.W.Grant
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Мы дошли до O.W.Grant")))

(defrule Мы_дошли_до_Сияния
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Винный_бар))
(barParam(param Дорогой_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Мы дошли до Сияния")))

(defrule Мы_дошли_до_Мистера_Fox
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Сидрерия))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Мистер_Fox)))
(assert(appendmessagehalt "Мы дошли до Мистера Fox")))

(defrule Мы_дошли_до_Дров
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы дошли до Дров")))

(defrule Мы_дошли_до_Hops
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Hops)))
(assert(appendmessagehalt "Мы дошли до Hops")))

(defrule Мы_дошли_до_Своего_бара
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Свой_Бар)))
(assert(appendmessagehalt "Мы дошли до Своего бара")))

(defrule Мы_дошли_до_Эйнштейна
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_западном))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Мы дошли до Эйнштейна")))

(defrule Мы_дошли_до_Пинты_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на западном")))

(defrule Мы_дошли_до_Пинты_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на северном")))

(defrule Мы_дошли_до_Пинты_в_центре
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты в центре")))

(defrule Мы_дошли_до_Доброго_Эля_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_западном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на западном")))

(defrule Мы_дошли_до_Доброго_Эля_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на северном")))

(defrule Мы_дошли_до_Доброго_Эля_в_центре
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля в центре")))

(defrule Мы_дошли_до_Немца_Перца_Колбасы
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы дошли до Немца Перца Колбасы")))

(defrule Мы_дошли_до_Голодранца
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Голодранец)))
(assert(appendmessagehalt "Мы дошли до Голодранца")))

(defrule Мы_дошли_до_1984
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_1984)))
(assert(appendmessagehalt "Мы дошли до 1984")))

(defrule Мы_дошли_до_Квадрюпеля
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Мы дошли до Квадрюпеля")))

(defrule Мы_дошли_до_Красного_Крокодила
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы дошли до Красного Крокодила")))

(defrule Мы_дошли_до_Шамайки
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Шамайка)))
(assert(appendmessagehalt "Мы дошли до Шамайки")))

(defrule Мы_дошли_до_Корриды
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_на_северном))
(barParam(param Бар_широкого_профиля))
(barParam(param Бар_средней_ценовой_категории))
(barParam(param Большой_бар))
=>
(assert(barParam(param Бар_Коррида)))
(assert(appendmessagehalt "Мы дошли до Корриды")))

(defrule Мы_дошли_до_London_Pub
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_с_парой_больших_столов))
=>
(assert(barParam(param Бар_London_Pub)))
(assert(appendmessagehalt "Мы дошли до London Pub")))

(defrule Мы_дошли_до_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Мы дошли до St. Patrick’s Pub")))

(defrule Мы_дошли_до_Mozart_Wine_House
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Винный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Мы дошли до Mozart Wine House")))

(defrule Мы_дошли_до_Шкипера
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Пивной_бар))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Шкипер)))
(assert(appendmessagehalt "Мы дошли до Шкипера")))

(defrule Мы_дошли_до_Mojo
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Коктейльный_бар))
(barParam(param Дорогой_бар))
(barParam(param Бар_только_с_маленькими_столиками))
=>
(assert(barParam(param Бар_Mojo)))
(assert(appendmessagehalt "Мы дошли до Mojo")))

(defrule Мы_дошли_до_Чёрного_кота
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича))
(barParam(param Располагается_в_центрe))
(barParam(param Бар_широкого_профиля))
(barParam(param Дешёвый_бар))
(barParam(param Бар_без_столиков))
=>
(assert(barParam(param Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы дошли до Чёрного кота")))

(defrule Есть_настольный_футбол_и_можно_сидеть_после_закрытия_=>_можно_посидеть_компанией
(declare(salience 40))
(barParam(param Есть_настольный_футбол))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Можно_посидеть_компанией)))
(assert(appendmessagehalt "Есть настольный футбол и можно сидеть после закрытия => можно посидеть компанией")))

(defrule Нет_столиков_на_улице_и_все_равно_проверяют_ли_QR-код_=>_привитый
(declare(salience 40))
(barParam(param Нет_столиков_на_улице))
(barParam(param Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(param Привитый)))
(assert(appendmessagehalt "Нет столиков на улице и все равно проверяют ли QR-код => привитый")))

(defrule Есть_кухня_и_милые_официанты_=>_бар-ресторан_с_хорошим_обслуживанием
(declare(salience 40))
(barParam(param Есть_кухня))
(barParam(param Милые_официанты))
=>
(assert(barParam(param Бар-ресторан_с_хорошим_обслуживанием)))
(assert(appendmessagehalt "Есть кухня и милые официанты => бар-ресторан с хорошим обслуживанием")))

(defrule Кальян_не_обязателен_и_кухня_не_обязательна_=>_зашли_просто_выпить
(declare(salience 40))
(barParam(param Кальян_не_обязателен))
(barParam(param Кухня_не_обязательна))
=>
(assert(barParam(param Зашли_просто_выпить)))
(assert(appendmessagehalt "Кальян не обязателен и кухня не обязательна => зашли просто выпить")))

(defrule Можно_сидеть_после_закрытия_и_есть_кухня_=>_отмечаем_что-то
(declare(salience 40))
(barParam(param Можно_сидеть_после_закрытия))
(barParam(param Есть_кухня))
=>
(assert(barParam(param Отмечаем_что-то)))
(assert(appendmessagehalt "Можно сидеть после закрытия и есть кухня => отмечаем что-то")))

(defrule Кот_и_настольный_футбол_не_обязательны,_на_официантов_все_равно_=>_поздравляю,_вы_социо-_и_котофоб
(declare(salience 40))
(barParam(param Кот_не_обязателен))
(barParam(param Устроят_обычные_официанты))
(barParam(param Настольный_футбол_не_обязателен))
=>
(assert(barParam(param Социо-_и_котофоб)))
(assert(appendmessagehalt "Кот и настольный футбол не обязательны, на официантов все равно => поздравляю, вы социо- и котофоб")))

(defrule Кошатники
(declare(salience 40))
(barParam(param Устроят_обычные_официанты))
(barParam(param Хочу_кота!))
(barParam(param Настольный_футбол_не_обязателен))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Кошатники)))
(assert(appendmessagehalt "Кошатники")))

(defrule Обниматься_с_котом_до_закрытия
(declare(salience 40))
(barParam(param Кошатники))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Обниматься_с_котом__до_закрытия)))
(assert(appendmessagehalt "Обниматься с котом до закрытия")))

(defrule Обниматься_с_котом_до_утра
(declare(salience 40))
(barParam(param Кошатники))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Обниматься_с_котом_до_утра)))
(assert(appendmessagehalt "Обниматься с котом до утра")))

(defrule Кошатники,_которым_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Есть_столики_на_улице))
(barParam(param Обниматься_с_котом__до_закрытия))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Кошатники, которым все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель")))

(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Обниматься_с_котом__до_закрытия))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый обнимается с котом  до закрытия => Бар Квадрюпель")))

(defrule Обниматься_с_котом_до_утра,_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Есть_столики_на_улице))
(barParam(param Обниматься_с_котом_до_утра))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Обниматься с котом до утра, все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель")))

(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Обниматься_с_котом_до_утра))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый обнимается с котом до утра => Бар Квадрюпель")))

(defrule Обниматься_с_котом__до_закрытия_без_QR-кода_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Не_требуется_QR-код))
(barParam(param Нет_столиков_на_улице))
(barParam(param Обниматься_с_котом__до_закрытия))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Обниматься с котом  до закрытия без QR-кода => Бар Есенин")))

(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Обниматься_с_котом__до_закрытия))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Привитый обнимается с котом  до закрытия => Бар Есенин")))

(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Обниматься_с_котом_до_утра))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Привитый обнимается с котом до утра => Бар Есенин")))

(defrule Обниматься_с_котом_до_утра,_не_требуется_QR-код,_нет_столиков_на_улице_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Не_требуется_QR-код))
(barParam(param Нет_столиков_на_улице))
(barParam(param Обниматься_с_котом_до_утра))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Обниматься с котом до утра, не требуется QR-код, нет столиков на улице => Бар Есенин")))

(defrule Бар-ресторан_с_хорошим_обслуживанием_без_кота,_кикера_и_кальяна_=>_бар_для_представительных_персон
(declare(salience 40))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием))
(barParam(param Кот_не_обязателен))
(barParam(param Настольный_футбол_не_обязателен))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_для_представительных_персон)))
(assert(appendmessagehalt "Бар-ресторан с хорошим обслуживанием без кота, кикера и кальяна => бар для представительных персон")))

(defrule Бар_для_привитых_представительных_персон
(declare(salience 40))
(barParam(param Бар_для_представительных_персон))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_для_привитых_представительных_персон)))
(assert(appendmessagehalt "Бар для привитых представительных персон")))

(defrule Бар_для_представительных_персон,_которым_рано_вставать
(declare(salience 40))
(barParam(param Бар_для_представительных_персон))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Бар_для_представительных_персон,_которым_рано_вставать)))
(assert(appendmessagehalt "Бар для представительных персон, которым рано вставать")))

(defrule Социо-_и_котофоб,_которому_рано_вставать
(declare(salience 40))
(barParam(param Социо-_и_котофоб))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Социо-_и_котофоб,_которому_рано_вставать)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать")))

(defrule Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)))
(assert(appendmessagehalt "Бар для привитых представительных персон которым ещё и рано вставать (бедные...)")))

(defrule Бар_для_привитых_представительных_персон,_где_можно_сидеть_после_закрытия_=>_Бар_O.W._Grant
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар для привитых представительных персон, где можно сидеть после закрытия => Бар O.W. Grant")))

(defrule Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать__Коррида
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать))
=>
(assert(barParam(param Бар_Коррида)))
(assert(appendmessagehalt "Бар для привитых представительных персон, которым ещё и рано вставать (жалко их...) => Коррида")))

(defrule Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать__Красный_Крокодил
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар для привитых представительных персон, которым ещё и рано вставать (жалко их...) => Красный Крокодил")))

(defrule Социо-_и_котофоб,_которому_рано_вставать_=>_Бар_O.W.Grant
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать))
(barParam(param Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать => Бар O.W.Grant")))

(defrule Социо-_и_котофоб_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием__Бар_Сияние
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => Бар Сияние")))

(defrule Социо-_и_котофоб_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием__London_Pub
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием))
=>
(assert(barParam(param Бар_London_Pub)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => London Pub")))

(defrule Бар_без_столиков_на_улице_для_представительных_персон,_которым_рано_вставать_=>_Красный_Крокодил
(declare(salience 40))
(barParam(param Бар_для_представительных_персон,_которым_рано_вставать))
(barParam(param Не_требуется_QR-код))
(barParam(param Нет_столиков_на_улице))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар без столиков на улице для представительных персон, которым рано вставать => Красный Крокодил")))

(defrule Бар-ресторан_с_хорошим_обслуживанием_для_представительных_персон,_которым_рано_вставать_=>_Бар_Сияние
(declare(salience 40))
(barParam(param Бар_для_представительных_персон,_которым_рано_вставать))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием))
(barParam(param Есть_столики_на_улице))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Бар-ресторан с хорошим обслуживанием для представительных персон, которым рано вставать => Бар Сияние")))

(defrule Нелюдимый_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Социо-_и_котофоб))
(barParam(param Зашли_просто_выпить))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Нелюдимый алкоголик пришёл сидеть до утра")))

(defrule Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Нелюдимый  социально ответственный алкоголик пришёл сидеть до утра")))

(defrule Алкоголик-домосед_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Нет_столиков_на_улице))
=>
(assert(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Алкоголик-домосед пришёл сидеть до утра")))

(defrule Привитый_социо-_и_котофоб_отмечает_без_кальяна__Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Социо-_и_котофоб))
(barParam(param Привитый))
(barParam(param Кальян_не_обязателен))
(barParam(param Отмечаем_что-то))
=>
(assert(barParam(param Бар_Мистер_Fox)))
(assert(appendmessagehalt "Привитый социо- и котофоб отмечает без кальяна =>Бар Мистер Fox")))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Есенин")))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_O.W.Grant
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар O.W.Grant	  ")))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Квадрюпель")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Дрова
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Дрова")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Мистер_Fox)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Мистер Fox")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>Бар_Чёрный_кот
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Чёрный_кот)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра =>Бар Чёрный кот")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Голодранец
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Голодранец)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Голодранец")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Шкипер
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Шкипер)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Шкипер")))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Свой_Бар
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(param Привитый))
=>
(assert(barParam(param Бар_Свой_Бар)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Свой Бар")))

(defrule Алкоголик-домосед_пришёл_сидеть_до_утра_без_QR-кода_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Есть_столики_на_улице))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Алкоголик-домосед пришёл сидеть до утра без QR-кода на улице => Бар Квадрюпель")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра))
(barParam(param Не_требуется_QR-код))
=>
(assert(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра__Бар_Есенин
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Есенин     		   ")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Квадрюпель")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Дрова
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Дрова")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Голодранец
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(param Бар_Голодранец)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Голодранец")))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Чёрный_кот
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(param Бар_Чёрный_кот)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Чёрный кот")))

(defrule Привитый_курильщик
(declare(salience 40))
(barParam(param Есть_кальян))
(barParam(param Привитый))
=>
(assert(barParam(param Привитый_курильщик)))
(assert(appendmessagehalt "Привитый курильщик")))

(defrule Обозлённый_на_мир_офисный_планктон
(declare(salience 40))
(barParam(param Привитый_курильщик))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Обозлённый_на_мир_офисный_планктон)))
(assert(appendmessagehalt "Обозлённый на мир офисный планктон")))

(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(param Обозлённый_на_мир_офисный_планктон))
(barParam(param Есть_кухня))
=>
(assert(barParam(param Бар_Mojo)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Mojo")))

(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(param Обозлённый_на_мир_офисный_планктон))
(barParam(param Кухня_не_обязательна))
=>
(assert(barParam(param Бар_Mojo)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Mojo")))

(defrule Мы_поняли_что_за_человек_такой_перед_нами
(declare(salience 40))
(barParam(param Привитый_курильщик))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
(barParam(param Устроят_обычные_официанты))
(barParam(param Кот_не_обязателен))
=>
(assert(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано)))
(assert(appendmessagehalt "Мы поняли что за человек такой перед нами")))

(defrule Мы_нашли_странного_человека
(declare(salience 40))
(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(param Есть_настольный_футбол))
=>
(assert(barParam(param Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано)))
(assert(appendmessagehalt "Мы нашли странного человека")))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова")))

(defrule Мы_идентифицировали_игрока_в_кикер
(declare(salience 40))
(barParam(param Есть_настольный_футбол))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
(barParam(param Кот_не_обязателен))
(barParam(param Устроят_обычные_официанты))
=>
(assert(barParam(param Непривередливый_игрок_в_кикер)))
(assert(appendmessagehalt "Мы идентифицировали игрока в кикер")))

(defrule Игрок_ещё_и_привит
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер))
(barParam(param Привитый))
=>
(assert(barParam(param Привитый_непривередливый_игрок_в_кикер)))
(assert(appendmessagehalt "Игрок ещё и привит")))

(defrule Мерзлявый_непривитый_алкоигрок_в_кикер
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер))
(barParam(param Зашли_просто_выпить))
(barParam(param Нет_столиков_на_улице))
(barParam(param Не_требуется_QR-код))
=>
(assert(barParam(param Мерзлявый_непривитый_алкоигрок_в_кикер)))
(assert(appendmessagehalt "Мерзлявый непривитый алкоигрок в кикер")))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер))
(barParam(param Есть_кухня))
(barParam(param Нет_столиков_на_улице))
(barParam(param Не_требуется_QR-код))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу...")))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу...")))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Есть_кухня))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу...")))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Мерзлявый_непривитый_алкоигрок_в_кикер))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова")))

(defrule Мы_предварительно_пришли_по_фичам_в_1984
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_1984)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в 1984")))

(defrule Мы_предварительно_пришли_по_фичам_в_пивко
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Пив_ко)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в пивко")))

(defrule Мы_предварительно_пришли_по_фичам_в_пивноff
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Пивноff)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в пивноff")))

(defrule Мы_предварительно_пришли_по_фичам_в_Hops
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Hops)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Hops")))

(defrule Мы_предварительно_пришли_по_фичам_в_Чёрный_кот
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Чёрный кот")))

(defrule Мы_предварительно_пришли_по_фичам_в_Голодранец
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Голодранец)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Голодранец")))

(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Добрый Эль")))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова")))

(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Пинту")))

(defrule Мы_предварительно_пришли_по_фичам_в_Красного_Крокодила
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Красного Крокодила")))

(defrule Мы_предварительно_пришли_по_фичам_в_Есенина
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Есенин)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Есенина")))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу")))

(defrule Мы_пришли_к_непривередливым_антикошатникам
(declare(salience 40))
(barParam(param Устроят_обычные_официанты))
(barParam(param Кот_не_обязателен))
(barParam(param Можно_посидеть_компанией))
=>
(assert(barParam(param Непривередливая_компания_антикошатников)))
(assert(appendmessagehalt "Мы пришли к непривередливым антикошатникам")))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики))
(barParam(param Непривередливая_компания_антикошатников))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова")))

(defrule Мы_пришли_к_страшному_человеку
(declare(salience 40))
(barParam(param Кальян_не_обязателен))
(barParam(param Есть_кухня))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)))
(assert(appendmessagehalt "Мы пришли к страшному человеку")))

(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Добрый Эль")))

(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Пинту")))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу")))

(defrule Жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(param Есть_столики_на_улице))
(barParam(param Зашли_просто_выпить))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить)))
(assert(appendmessagehalt "Жаворонок-одиночка, который просто хочет накатить на свежем воздухе")))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить))
(barParam(param Не_требуется_QR-код))
=>
(assert(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе")))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе
(declare(salience 40))
(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить))
(barParam(param Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить  на свежем воздухе")))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Пинта_
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Пинта ")))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(param Бар_Hops)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Hops")))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(param Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Квадрюпель")))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Сияние_
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Сияние ")))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе))
=>
(assert(barParam(param Бар_Hops)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Hops")))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Пинта
(declare(salience 40))
(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Пинта")))

(defrule Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице
(declare(salience 40))
(barParam(param Есть_столики_на_улице))
(barParam(param Кальян_не_обязателен))
(barParam(param Есть_кухня))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице)))
(assert(appendmessagehalt "Некурящий одинокий жаворонок, который хочет покушать на улице")))

(defrule Привитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице))
(barParam(param Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Привитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта")))

(defrule Непривитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице))
(barParam(param Не_требуется_QR-код))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Непривитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта")))

(defrule Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём
(declare(salience 40))
(barParam(param Есть_столики_на_улице))
(barParam(param Настольный_футбол_не_обязателен))
(barParam(param Все_равно_проверяют_ли_QR-кода))
(barParam(param Кот_не_обязателен))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём)))
(assert(appendmessagehalt "Привитый футболохейтер, который хочет посидеть на свежем воздухе днём")))

(defrule Привитый_некурящий_непривередливый_голодный_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём))
(barParam(param Кальян_не_обязателен))
(barParam(param Устроят_обычные_официанты))
(barParam(param Есть_кухня))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Привитый некурящий непривередливый голодный футболохейтер, который хочет посидеть на свежем воздухе днём => Сияние")))

(defrule Привитый_футболохейтер,_который_хочет_просто_выпить_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём))
(barParam(param Милые_официанты))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Привитый футболохейтер, который хочет просто выпить на свежем воздухе днём => Сияние")))

(defrule Непривитые_мерзляки
(declare(salience 40))
(barParam(param Нет_столиков_на_улице))
(barParam(param Не_требуется_QR-код))
=>
(assert(barParam(param Непривитые_мерзляки)))
(assert(appendmessagehalt "Непривитые мерзляки")))

(defrule Непривитые_мерзляки-алкоголики
(declare(salience 40))
(barParam(param Непривитые_мерзляки))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Непривитые_мерзляки-алкоголики)))
(assert(appendmessagehalt "Непривитые мерзляки-алкоголики")))

(defrule Мы_предварительно_пришли_по_фичам_в_Красный_Крокодил
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
(barParam(param Настольный_футбол_не_обязателен))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Красный Крокодил")))

(defrule Мы_дошли_до_зожника_с_прибабахом
(declare(salience 40))
(barParam(param Кальян_не_обязателен))
(barParam(param Есть_кухня))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(param Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)))
(assert(appendmessagehalt "Мы дошли до зожника с прибабахом")))

(defrule Мы_дошли_до_непривередливого_антикошатника
(declare(salience 40))
(barParam(param Кот_не_обязателен))
(barParam(param Устроят_обычные_официанты))
=>
(assert(barParam(param Непривередливый_антикошатник)))
(assert(appendmessagehalt "Мы дошли до непривередливого антикошатника")))

(defrule Мы_пришли_к_очередному_клерку
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)))
(assert(appendmessagehalt "Мы пришли к очередному клерку")))

(defrule Мы_пришли_к_привитому_непривередливому_антикошатнику
(declare(salience 40))
(barParam(param Привитый))
(barParam(param Непривередливый_антикошатник))
=>
(assert(barParam(param Привитый_непривередливый_антикошатник)))
(assert(appendmessagehalt "Мы пришли к привитому непривередливому антикошатнику")))

(defrule Бар_Сияние
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Бар Сияние")))

(defrule Бар_London_Pub
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_London_Pub)))
(assert(appendmessagehalt "Бар London Pub")))

(defrule Бар_Коррида
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Коррида)))
(assert(appendmessagehalt "Бар Коррида")))

(defrule Бар_Свой_Бар
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Свой_Бар)))
(assert(appendmessagehalt "Бар Свой Бар")))

(defrule Бар_Свой_Бар_
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_утра))
=>
(assert(barParam(param Бар_Свой_Бар)))
(assert(appendmessagehalt "Бар Свой Бар ")))

(defrule Бар_Mozart_Wine_House
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Бар Mozart Wine House")))

(defrule Бар_Пинта
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Пинта)))
(assert(appendmessagehalt "Бар Пинта")))

(defrule Бар_Дрова
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник))
(barParam(param Можно_посидеть_компанией))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Бар_Дрова)))
(assert(appendmessagehalt "Бар Дрова")))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян))
(barParam(param Отмечаем_что-то))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant")))

(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил")))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать_до_утра))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant")))

(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил")))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant")))

(defrule Бар_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Бар St. Patrick’s Pub")))

(defrule Бар_Коррида
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Коррида)))
(assert(appendmessagehalt "Бар Коррида")))

(defrule Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Мистер_Fox)))
(assert(appendmessagehalt "Бар Мистер Fox")))

(defrule Бар_Mojo	
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Mojo)))
(assert(appendmessagehalt "Бар Mojo")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
(barParam(param Есть_кухня))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(param Кухня_не_обязательна))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Есть_кухня))
(barParam(param Есть_кальян))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Кухня_не_обязательна))
(barParam(param Есть_кальян))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Кухня_не_обязательна))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер))
(barParam(param Есть_кухня))
(barParam(param Кальян_не_обязателен))
=>
(assert(barParam(param Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн")))

(defrule Бар_Сияние
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Сияние)))
(assert(appendmessagehalt "Бар Сияние")))

(defrule Бар_O.W.Grant	
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant")))

(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил")))

(defrule Бар_London_Pub
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_London_Pub)))
(assert(appendmessagehalt "Бар London Pub")))

(defrule Бар_Добрый_Эль
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Добрый_Эль)))
(assert(appendmessagehalt "Бар Добрый Эль")))

(defrule Бар_Немец_Перец_Колбаса
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Бар Немец Перец Колбаса")))

(defrule Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник))
(barParam(param Кальян_не_обязателен))
(barParam(param Настольный_футбол_не_обязателен))
=>
(assert(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян)))
(assert(appendmessagehalt "Привитый непривередливый антикошатник, не играющий в кикер и не курящий кальян")))

(defrule Пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Милые_официанты))
(barParam(param Настольный_футбол_не_обязателен))
(barParam(param Кот_не_обязателен))
(barParam(param Зашли_просто_выпить))
=>
(assert(barParam(param Пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Пришли выпить и поболтать")))

(defrule Привитые_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Пришли_выпить_и_поболтать))
(barParam(param Привитый))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать")))

(defrule Привитые_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать до закрытия")))

(defrule Привитые_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать_до_утра)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать до утра")))

(defrule Мерзляки_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Пришли_выпить_и_поболтать))
(barParam(param Нет_столиков_на_улице))
=>
(assert(barParam(param Мерзляки_пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Мерзляки пришли выпить и поболтать")))

(defrule Мерзляки_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать))
(barParam(param Можно_сидеть_после_закрытия))
=>
(assert(barParam(param Мерзляки_пришли_выпить_и_поболтать_до_утра)))
(assert(appendmessagehalt "Мерзляки пришли выпить и поболтать до утра")))

(defrule Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать))
(barParam(param Не_требуется_QR-код))
(barParam(param Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(param Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия)))
(assert(appendmessagehalt "Непривитые мерзляки пришли выпить и поболтать до закрытия")))

