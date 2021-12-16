(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(param Большая_компания)(confidence ?c1))
=>
(assert(barParam(param Большой_бар)(confidence (* 0.94 ?c1)))
(assert(appendmessagehalt (str-cat "Для больших компаний - только большие бары("(* 0.94 ?c1)")"))))


(defrule Маленькая_компания_может_пойти_в_большой_бар
(declare(salience 40))
(barParam(param Компания_до_4_человек)(confidence ?c1))
=>
(assert(barParam(param Большой_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Маленькая компания может пойти в большой бар("(* 0.74 ?c1)")"))))


(defrule Маленькая_компания_поместится_в_бар_с_парой_больших_столов
(declare(salience 40))
(barParam(param Компания_до_4_человек)(confidence ?c1))
=>
(assert(barParam(param Бар_с_парой_больших_столов)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Маленькая компания поместится в бар с парой больших столов("(* 0.74 ?c1)")"))))


(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(param Большая_компания)(confidence ?c1))
=>
(assert(barParam(param Большой_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Для больших компаний - только большие бары("(* 0.74 ?c1)")"))))


(defrule Вдвоём_можно_сходить_в_большой_бар
(declare(salience 40))
(barParam(param Вдвоем)(confidence ?c1))
=>
(assert(barParam(param Большой_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вдвоём можно сходить в большой бар("(* 0.74 ?c1)")"))))


(defrule Вдвоём_можно_сходить_и_в_средний_бар
(declare(salience 40))
(barParam(param Вдвоем)(confidence ?c1))
=>
(assert(barParam(param Бар_с_парой_больших_столов)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вдвоём можно сходить и в средний бар("(* 0.74 ?c1)")"))))


(defrule Вдвоём_поместитесь_за_маленьким_столиком
(declare(salience 40))
(barParam(param Вдвоем)(confidence ?c1))
=>
(assert(barParam(param Бар_только_с_маленькими_столиками)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вдвоём поместитесь за маленьким столиком("(* 0.74 ?c1)")"))))


(defrule Одному_можно_посидеть_за_барной_стойкой
(declare(salience 40))
(barParam(param В_одиночку)(confidence ?c1))
=>
(assert(barParam(param Бар_без_столиков)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Одному можно посидеть за барной стойкой("(* 0.74 ?c1)")"))))


(defrule Одному_можно_посидеть_за_столиком
(declare(salience 40))
(barParam(param В_одиночку)(confidence ?c1))
=>
(assert(barParam(param Бар_только_с_маленькими_столиками)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Одному можно посидеть за столиком("(* 0.74 ?c1)")"))))


(defrule Одному_можно_прийти_в_средний_бар
(declare(salience 40))
(barParam(param В_одиночку)(confidence ?c1))
=>
(assert(barParam(param Бар_с_парой_больших_столов)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Одному можно прийти в средний бар("(* 0.74 ?c1)")"))))


(defrule Одному_можно_найти_место_в_большом_баре
(declare(salience 40))
(barParam(param В_одиночку)(confidence ?c1))
=>
(assert(barParam(param Большой_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Одному можно найти место в большом баре("(* 0.74 ?c1)")"))))


(defrule Если_сотка_в_кармане_-_иди_в_дешёвый_бар
(declare(salience 40))
(barParam(param Посидеть_на_сотку)(confidence ?c1))
=>
(assert(barParam(param Дешёвый_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Если сотка в кармане - иди в дешёвый бар("(* 0.74 ?c1)")"))))


(defrule Если_у_тебя_есть_стипендия_-_купи_много_в_дешёвом_баре
(declare(salience 40))
(barParam(param Посидеть_на_стипендию)(confidence ?c1))
=>
(assert(barParam(param Дешёвый_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Если у тебя есть стипендия - купи много в дешёвом баре("(* 0.74 ?c1)")"))))


(defrule Со_стипендией_можно_пойти_в_бар_со_средними_ценами
(declare(salience 40))
(barParam(param Посидеть_на_стипендию)(confidence ?c1))
=>
(assert(barParam(param Бар_средней_ценовой_категории)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Со стипендией можно пойти в бар со средними ценами("(* 0.74 ?c1)")"))))


(defrule Если_ты_с_зарплатой_-_купи_очень_много_в_дешёвом_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату)(confidence ?c1))
=>
(assert(barParam(param Дешёвый_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Если ты с зарплатой - купи очень много в дешёвом баре("(* 0.74 ?c1)")"))))


(defrule Если_ты_с_зарплатой_-_иди_веселись_в_среднем_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату)(confidence ?c1))
=>
(assert(barParam(param Бар_средней_ценовой_категории)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Если ты с зарплатой - иди веселись в среднем баре("(* 0.74 ?c1)")"))))


(defrule С_зарплатой_и_с_QR_кодом_можно_шиковать_в_дорогом_баре
(declare(salience 40))
(barParam(param Посидеть_на_зарплату)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
=>
(assert(barParam(param Дорогой_бар)(confidence (* 0.74 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "С зарплатой и с QR кодом можно шиковать в дорогом баре("(* 0.74 (min ?c1 ?c2))")"))))


(defrule Лонг_дринки_-_легко
(declare(salience 40))
(barParam(param Коктейли)(confidence ?c1))
=>
(assert(barParam(param Слабоалкогольные_напитки)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Лонг дринки - легко("(* 0.74 ?c1)")"))))


(defrule Пиво_-_легко
(declare(salience 40))
(barParam(param Пиво)(confidence ?c1))
=>
(assert(barParam(param Слабоалкогольные_напитки)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Пиво - легко("(* 0.74 ?c1)")"))))


(defrule Сидр_-_легко
(declare(salience 40))
(barParam(param Cидр)(confidence ?c1))
=>
(assert(barParam(param Слабоалкогольные_напитки)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Сидр - легко("(* 0.74 ?c1)")"))))


(defrule Вино_-_легко
(declare(salience 40))
(barParam(param Вино)(confidence ?c1))
=>
(assert(barParam(param Слабоалкогольные_напитки)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вино - легко("(* 0.74 ?c1)")"))))


(defrule Сидр_=>_сидрерия
(declare(salience 40))
(barParam(param Cидр)(confidence ?c1))
=>
(assert(barParam(param Сидрерия)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Сидр => сидрерия("(* 0.74 ?c1)")"))))


(defrule Сидр_=>_пивной_бар
(declare(salience 40))
(barParam(param Cидр)(confidence ?c1))
=>
(assert(barParam(param Пивной_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Сидр => пивной бар("(* 0.74 ?c1)")"))))


(defrule Слабый_алкоголь_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(param Слабоалкогольные_напитки)(confidence ?c1))
=>
(assert(barParam(param Бар_широкого_профиля)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Слабый алкоголь => бар широкого профиля("(* 0.74 ?c1)")"))))


(defrule Вино_=>_винный_бар
(declare(salience 40))
(barParam(param Вино)(confidence ?c1))
=>
(assert(barParam(param Винный_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вино => винный бар("(* 0.74 ?c1)")"))))


(defrule Вино_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(param Вино)(confidence ?c1))
=>
(assert(barParam(param Бар_широкого_профиля)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Вино => бар широкого профиля("(* 0.74 ?c1)")"))))


(defrule Пиво_=>_пивбар
(declare(salience 40))
(barParam(param Пиво)(confidence ?c1))
=>
(assert(barParam(param Пивной_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Пиво => пивбар("(* 0.74 ?c1)")"))))


(defrule Крепкие_напитки_=>_Бар_широкого_профиля
(declare(salience 40))
(barParam(param Крепкие_напитки)(confidence ?c1))
=>
(assert(barParam(param Бар_широкого_профиля)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Крепкие напитки => Бар широкого профиля("(* 0.74 ?c1)")"))))


(defrule Лонг_дринки_=>_Коктейльный_бар
(declare(salience 40))
(barParam(param Коктейли)(confidence ?c1))
=>
(assert(barParam(param Коктейльный_бар)(confidence (* 0.74 ?c1)))
(assert(appendmessagehalt (str-cat "Лонг дринки => Коктейльный бар("(* 0.74 ?c1)")"))))


(defrule Есть_все_отрицания_фич_=>_нам_на_них_всё_равно
(declare(salience 40))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
(barParam(param Кухня_не_обязательна)(confidence ?c4))
(barParam(param Устроят_обычные_официанты)(confidence ?c5))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c6))
(barParam(param Кот_не_обязателен)(confidence ?c7))
(barParam(param Нет_столиков_на_улице)(confidence ?c8))
=>
(assert(barParam(param Не_выбрана_ни_одна_фича)(confidence (* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5 ?c6 ?c7 ?c8)))))
(assert(appendmessagehalt (str-cat "Есть все отрицания фич => нам на них всё равно("(* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5 ?c6 ?c7 ?c8))")"))))


(defrule Мы_дошли_до_пивка_на_западном
(declare(salience 40))
(barParam(param Бар_Пив_ко)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пив_ко)(confidence (* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивка на западном("(* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивка_на_северном
(declare(salience 40))
(barParam(param Бар_Пив_ко)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пив_ко)(confidence (* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивка на северном("(* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивноff_на_западном
(declare(salience 40))
(barParam(param Бар_Пивноff)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пивноff)(confidence (* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивноff на западном("(* 0.74 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивноff_на_северном
(declare(salience 40))
(barParam(param Бар_Пивноff)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пивноff)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивноff на северном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Есенина
(declare(salience 40))
(barParam(param Бар_Есенин)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Есенина("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_O.W.Grant
(declare(salience 40))
(barParam(param Бар_O.W.Grant)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до O.W.Grant("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Сияния
(declare(salience 40))
(barParam(param Бар_Сияние)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Винный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Сияния("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Мистера_Fox
(declare(salience 40))
(barParam(param Бар_Мистер_Fox)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Сидрерия)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Мистер_Fox)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Мистера Fox("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Дров
(declare(salience 40))
(barParam(param Бар_Дрова)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Дров("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Hops
(declare(salience 40))
(barParam(param Бар_Hops)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Hops)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Hops("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Своего_бара
(declare(salience 40))
(barParam(param Бар_Свой_Бар)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Свой_Бар)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Своего бара("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Эйнштейна
(declare(salience 40))
(barParam(param Бар_Эйнштейн)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Эйнштейна("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_на_западном
(declare(salience 40))
(barParam(param Бар_Пинта)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты на западном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_на_северном
(declare(salience 40))
(barParam(param Бар_Пинта)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты на северном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_в_центре
(declare(salience 40))
(barParam(param Бар_Пинта)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты в центре("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_на_западном
(declare(salience 40))
(barParam(param Бар_Добрый_Эль)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля на западном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_на_северном
(declare(salience 40))
(barParam(param Бар_Добрый_Эль)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля на северном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_в_центре
(declare(salience 40))
(barParam(param Бар_Добрый_Эль)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля в центре("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Немца_Перца_Колбасы
(declare(salience 40))
(barParam(param Бар_Немец_Перец_Колбаса)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Немца Перца Колбасы("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Голодранца
(declare(salience 40))
(barParam(param Бар_Голодранец)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Голодранец)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Голодранца("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_1984
(declare(salience 40))
(barParam(param Бар_1984)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_1984)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до 1984("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Квадрюпеля
(declare(salience 40))
(barParam(param Бар_Квадрюпель)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Квадрюпеля("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Красного_Крокодила
(declare(salience 40))
(barParam(param Бар_Красный_Крокодил)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Красного Крокодила("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Шамайки
(declare(salience 40))
(barParam(param Бар_Шамайка)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Шамайка)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Шамайки("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Корриды
(declare(salience 40))
(barParam(param Бар_Коррида)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Коррида)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Корриды("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_London_Pub
(declare(salience 40))
(barParam(param Бар_London_Pub)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_London_Pub)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до London Pub("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Бар_St._Patrick’s_Pub)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до St. Patrick’s Pub("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Mozart_Wine_House
(declare(salience 40))
(barParam(param Бар_Mozart_Wine_House)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Винный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Mozart_Wine_House)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Mozart Wine House("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Шкипера
(declare(salience 40))
(barParam(param Бар_Шкипер)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Шкипер)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Шкипера("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Mojo
(declare(salience 40))
(barParam(param Бар_Mojo)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Mojo)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Mojo("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Чёрного_кота
(declare(salience 40))
(barParam(param Бар_Чёрный_кот)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Чёрный_кот)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Чёрного кота("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивка_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пив_ко)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивка на западном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивка_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пив_ко)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивка на северном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивноff_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пивноff)(confidence (* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивноff на западном("(* 1 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_пивноff_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Пивноff)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до пивноff на северном("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Есенина
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Есенина("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_O.W.Grant
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до O.W.Grant("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Сияния
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Винный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Сияния("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Мистера_Fox
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Сидрерия)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Мистер_Fox)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Мистера Fox("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Дров
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Дров("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Hops
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Hops)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Hops("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Своего_бара
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Свой_Бар)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Своего бара("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Эйнштейна
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Эйнштейна("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты на западном("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты на северном("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Пинты_в_центре
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Пинты в центре("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_на_западном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_западном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля на западном("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_на_северном
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля на северном("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Доброго_Эля_в_центре
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Доброго Эля в центре("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Немца_Перца_Колбасы
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Немца Перца Колбасы("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Голодранца
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Голодранец)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Голодранца("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_1984
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_1984)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до 1984("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Квадрюпеля
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Квадрюпеля("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Красного_Крокодила
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Красного Крокодила("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Шамайки
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Шамайка)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Шамайки("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Корриды
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_на_северном)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Бар_средней_ценовой_категории)(confidence ?c4))
(barParam(param Большой_бар)(confidence ?c5))
=>
(assert(barParam(param Бар_Коррида)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Корриды("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_London_Pub
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_с_парой_больших_столов)(confidence ?c5))
=>
(assert(barParam(param Бар_London_Pub)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до London Pub("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до St. Patrick’s Pub("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Mozart_Wine_House
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Винный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Mozart_Wine_House)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Mozart Wine House("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Шкипера
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Пивной_бар)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Шкипер)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Шкипера("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Mojo
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Коктейльный_бар)(confidence ?c3))
(barParam(param Дорогой_бар)(confidence ?c4))
(barParam(param Бар_только_с_маленькими_столиками)(confidence ?c5))
=>
(assert(barParam(param Бар_Mojo)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Mojo("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_дошли_до_Чёрного_кота
(declare(salience 40))
(barParam(param Не_выбрана_ни_одна_фича)(confidence ?c1))
(barParam(param Располагается_в_центрe)(confidence ?c2))
(barParam(param Бар_широкого_профиля)(confidence ?c3))
(barParam(param Дешёвый_бар)(confidence ?c4))
(barParam(param Бар_без_столиков)(confidence ?c5))
=>
(assert(barParam(param Бар_Чёрный_кот)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы дошли до Чёрного кота("(* 0.8 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Есть_настольный_футбол_и_можно_сидеть_после_закрытия_=>_можно_посидеть_компанией
(declare(salience 40))
(barParam(param Есть_настольный_футбол)(confidence ?c1))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Можно_посидеть_компанией)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Есть настольный футбол и можно сидеть после закрытия => можно посидеть компанией("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Нет_столиков_на_улице_и_все_равно_проверяют_ли_QR-код_=>_привитый
(declare(salience 40))
(barParam(param Нет_столиков_на_улице)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
=>
(assert(barParam(param Привитый)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нет столиков на улице и все равно проверяют ли QR-код => привитый("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Есть_кухня_и_милые_официанты_=>_бар-ресторан_с_хорошим_обслуживанием
(declare(salience 40))
(barParam(param Есть_кухня)(confidence ?c1))
(barParam(param Милые_официанты)(confidence ?c2))
=>
(assert(barParam(param Бар-ресторан_с_хорошим_обслуживанием)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Есть кухня и милые официанты => бар-ресторан с хорошим обслуживанием("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Кальян_не_обязателен_и_кухня_не_обязательна_=>_зашли_просто_выпить
(declare(salience 40))
(barParam(param Кальян_не_обязателен)(confidence ?c1))
(barParam(param Кухня_не_обязательна)(confidence ?c2))
=>
(assert(barParam(param Зашли_просто_выпить)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Кальян не обязателен и кухня не обязательна => зашли просто выпить("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Можно_сидеть_после_закрытия_и_есть_кухня_=>_отмечаем_что-то
(declare(salience 40))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
=>
(assert(barParam(param Отмечаем_что-то)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Можно сидеть после закрытия и есть кухня => отмечаем что-то("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Кот_и_настольный_футбол_не_обязательны,_на_официантов_все_равно_=>_поздравляю,_вы_социо-_и_котофоб
(declare(salience 40))
(barParam(param Кот_не_обязателен)(confidence ?c1))
(barParam(param Устроят_обычные_официанты)(confidence ?c2))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Социо-_и_котофоб)(confidence (* 0.8 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Кот и настольный футбол не обязательны, на официантов все равно => поздравляю, вы социо- и котофоб("(* 0.8 (min ?c1 ?c2 ?c3))")"))))


(defrule Кошатники
(declare(salience 40))
(barParam(param Устроят_обычные_официанты)(confidence ?c1))
(barParam(param Хочу_кота!)(confidence ?c2))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c3))
(barParam(param Зашли_просто_выпить)(confidence ?c4))
=>
(assert(barParam(param Кошатники)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Кошатники("(* 0.8 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Обниматься_с_котом_до_закрытия
(declare(salience 40))
(barParam(param Кошатники)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Обниматься_с_котом__до_закрытия_)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Обниматься с котом до закрытия("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Обниматься_с_котом_до_утра
(declare(salience 40))
(barParam(param Кошатники)(confidence ?c1))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Обниматься_с_котом_до_утра)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Обниматься с котом до утра("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Кошатники,_которым_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c1))
(barParam(param Есть_столики_на_улице)(confidence ?c2))
(barParam(param Обниматься_с_котом__до_закрытия_)(confidence ?c3))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.8 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Кошатники, которым все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель("(* 0.8 (min ?c1 ?c2 ?c3))")"))))


(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Обниматься_с_котом__до_закрытия_)(confidence ?c2))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый обнимается с котом  до закрытия => Бар Квадрюпель("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Обниматься_с_котом_до_утра,_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c1))
(barParam(param Есть_столики_на_улице)(confidence ?c2))
(barParam(param Обниматься_с_котом_до_утра)(confidence ?c3))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.8 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Обниматься с котом до утра, все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель("(* 0.8 (min ?c1 ?c2 ?c3))")"))))


(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Обниматься_с_котом_до_утра)(confidence ?c2))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый обнимается с котом до утра => Бар Квадрюпель("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Обниматься_с_котом__до_закрытия_без_QR-кода_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Не_требуется_QR-код)(confidence ?c1))
(barParam(param Нет_столиков_на_улице)(confidence ?c2))
(barParam(param Обниматься_с_котом__до_закрытия_)(confidence ?c3))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.8 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Обниматься с котом  до закрытия без QR-кода => Бар Есенин("(* 0.8 (min ?c1 ?c2 ?c3))")"))))


(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Обниматься_с_котом__до_закрытия_)(confidence ?c2))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый обнимается с котом  до закрытия => Бар Есенин("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Обниматься_с_котом_до_утра)(confidence ?c2))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.8 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый обнимается с котом до утра => Бар Есенин("(* 0.8 (min ?c1 ?c2))")"))))


(defrule Обниматься_с_котом_до_утра,_не_требуется_QR-код,_нет_столиков_на_улице_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Не_требуется_QR-код)(confidence ?c1))
(barParam(param Нет_столиков_на_улице)(confidence ?c2))
(barParam(param Обниматься_с_котом_до_утра)(confidence ?c3))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.8 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Обниматься с котом до утра, не требуется QR-код, нет столиков на улице => Бар Есенин("(* 0.8 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар-ресторан_с_хорошим_обслуживанием_без_кота,_кикера_и_кальяна_=>_бар_для_представительных_персон
(declare(salience 40))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием)(confidence ?c1))
(barParam(param Кот_не_обязателен)(confidence ?c2))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c3))
(barParam(param Кальян_не_обязателен)(confidence ?c4))
=>
(assert(barParam(param Бар_для_представительных_персон)(confidence (* 0.8 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Бар-ресторан с хорошим обслуживанием без кота, кикера и кальяна => бар для представительных персон("(* 0.8 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Бар_для_привитых_представительных_персон
(declare(salience 40))
(barParam(param Бар_для_представительных_персон)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_для_привитых_представительных_персон)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Бар для привитых представительных персон("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Бар_для_представительных_персон,_которым_рано_вставать
(declare(salience 40))
(barParam(param Бар_для_представительных_персон)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Бар_для_представительных_персон,_которым_рано_вставать)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Бар для представительных персон, которым рано вставать("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Социо-_и_котофоб,_которому_рано_вставать
(declare(salience 40))
(barParam(param Социо-_и_котофоб)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Социо- и котофоб, которому рано вставать("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Бар для привитых представительных персон которым ещё и рано вставать("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Бар_для_привитых_представительных_персон,_где_можно_сидеть_после_закрытия_=>_Бар_O.W._Grant
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон)(confidence ?c1))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Бар для привитых представительных персон, где можно сидеть после закрытия => Бар O.W. Grant("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_=>_Коррида
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence ?c1))
=>
(assert(barParam(param Бар_Коррида)(confidence (* 0.91 ?c1)))
(assert(appendmessagehalt (str-cat "Бар для привитых представительных персон, которым ещё и рано вставать => Коррида("(* 0.91 ?c1)")"))))


(defrule Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_=>_Красный_Крокодил
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence ?c1))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.91 ?c1)))
(assert(appendmessagehalt (str-cat "Бар для привитых представительных персон, которым ещё и рано вставать => Красный Крокодил("(* 0.91 ?c1)")"))))


(defrule Социо-_и_котофоб,_которому_рано_вставать_=>_Бар_O.W.Grant
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Социо- и котофоб, которому рано вставать => Бар O.W.Grant("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Социо-_и_котофоб,_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием_=>_Бар_Сияние
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence ?c1))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием)(confidence ?c2))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => Бар Сияние("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Социо-_и_котофоб,_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием_=>_London_Pub
(declare(salience 40))
(barParam(param Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать)(confidence ?c1))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием)(confidence ?c2))
=>
(assert(barParam(param Бар_London_Pub)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => London Pub("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Бар_без_столиков_на_улице_для_представительных_персон,_которым_рано_вставать_=>_Красный_Крокодил
(declare(salience 40))
(barParam(param Бар_для_представительных_персон,_которым_рано_вставать)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
(barParam(param Нет_столиков_на_улице)(confidence ?c3))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.91 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар без столиков на улице для представительных персон, которым рано вставать => Красный Крокодил("(* 0.91 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар-ресторан_с_хорошим_обслуживанием_для_представительных_персон,_которым_рано_вставать_=>_Бар_Сияние
(declare(salience 40))
(barParam(param Бар_для_представительных_персон,_которым_рано_вставать)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
(barParam(param Бар-ресторан_с_хорошим_обслуживанием)(confidence ?c3))
(barParam(param Есть_столики_на_улице)(confidence ?c4))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.91 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Бар-ресторан с хорошим обслуживанием для представительных персон, которым рано вставать => Бар Сияние("(* 0.91 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Нелюдимый_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Социо-_и_котофоб)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c3))
=>
(assert(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence (* 0.91 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Нелюдимый алкоголик пришёл сидеть до утра("(* 0.91 (min ?c1 ?c2 ?c3))")"))))


(defrule Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый  социально ответственный алкоголик пришёл сидеть до утра("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Алкоголик-домосед_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Нет_столиков_на_улице)(confidence ?c2))
=>
(assert(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра)(confidence (* 0.91 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед пришёл сидеть до утра("(* 0.91 (min ?c1 ?c2))")"))))


(defrule Привитый_социо-_и_котофоб_отмечает_без_кальяна_=>_Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Социо-_и_котофоб)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
(barParam(param Отмечаем_что-то)(confidence ?c4))
=>
(assert(barParam(param Бар_Мистер_Fox)(confidence (* 0.91 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Привитый социо- и котофоб отмечает без кальяна => Бар Мистер Fox("(* 0.91 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Есенин("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_O.W.Grant
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар O.W.Grant("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Квадрюпель("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Дрова
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Дрова("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Мистер_Fox)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Мистер Fox("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>Бар_Чёрный_кот
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Чёрный_кот)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра =>Бар Чёрный кот("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Голодранец
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Голодранец)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Голодранец("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Шкипер
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Шкипер)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Шкипер("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Свой_Бар
(declare(salience 40))
(barParam(param Нелюдимый_алкоголик_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Бар_Свой_Бар)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Свой Бар("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Алкоголик-домосед_пришёл_сидеть_до_утра_без_QR-кода_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
(barParam(param Есть_столики_на_улице)(confidence ?c3))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.86 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед пришёл сидеть до утра без QR-кода на улице => Бар Квадрюпель("(* 0.86 (min ?c1 ?c2 ?c3))")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(param Алкоголик-домосед_пришёл_сидеть_до_утра)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
=>
(assert(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Есенин("(* 0.86 ?c1)")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Квадрюпель("(* 0.86 ?c1)")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Дрова
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Дрова("(* 0.86 ?c1)")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Голодранец
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Голодранец)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Голодранец("(* 0.86 ?c1)")"))))


(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Чёрный_кот
(declare(salience 40))
(barParam(param Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Чёрный_кот)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Чёрный кот("(* 0.86 ?c1)")"))))


(defrule Привитый_курильщик
(declare(salience 40))
(barParam(param Есть_кальян)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Привитый_курильщик)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый курильщик("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Обозлённый_на_мир_офисный_планктон
(declare(salience 40))
(barParam(param Привитый_курильщик)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Обозлённый_на_мир_офисный_планктон)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Обозлённый на мир офисный планктон("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(param Обозлённый_на_мир_офисный_планктон)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
=>
(assert(barParam(param Бар_Mojo)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Mojo("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(param Обозлённый_на_мир_офисный_планктон)(confidence ?c1))
(barParam(param Кухня_не_обязательна)(confidence ?c2))
=>
(assert(barParam(param Бар_Mojo)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Mojo("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_поняли_что_за_человек_такой_перед_нами
(declare(salience 40))
(barParam(param Привитый_курильщик)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
(barParam(param Устроят_обычные_официанты)(confidence ?c3))
(barParam(param Кот_не_обязателен)(confidence ?c4))
=>
(assert(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано)(confidence (* 0.86 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Мы поняли что за человек такой перед нами("(* 0.86 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Мы_нашли_странного_человека
(declare(salience 40))
(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано)(confidence ?c1))
(barParam(param Есть_настольный_футбол)(confidence ?c2))
=>
(assert(barParam(param Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы нашли странного человека("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Дрова("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_идентифицировали_игрока_в_кикер!!
(declare(salience 40))
(barParam(param Есть_настольный_футбол)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
(barParam(param Кот_не_обязателен)(confidence ?c3))
(barParam(param Устроят_обычные_официанты)(confidence ?c4))
=>
(assert(barParam(param Непривередливый_игрок_в_кикер)(confidence (* 0.86 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Мы идентифицировали игрока в кикер!!("(* 0.86 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Игрок_ещё_и_привит!!!!
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Игрок ещё и привит!!!!("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мерзлявый_непривитый_алкоигрок_в_кикер
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
(barParam(param Нет_столиков_на_улице)(confidence ?c3))
(barParam(param Не_требуется_QR-код)(confidence ?c4))
=>
(assert(barParam(param Мерзлявый_непривитый_алкоигрок_в_кикер)(confidence (* 0.86 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Мерзлявый непривитый алкоигрок в кикер("(* 0.86 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Нет_столиков_на_улице)(confidence ?c3))
(barParam(param Не_требуется_QR-код)(confidence ?c4))
(barParam(param Кальян_не_обязателен)(confidence ?c5))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.86 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Немца Перца Колбасу...("(* 0.86 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Немца Перца Колбасу...("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.86 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Немца Перца Колбасу...("(* 0.86 (min ?c1 ?c2 ?c3))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Мерзлявый_непривитый_алкоигрок_в_кикер)(confidence ?c1))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.86 ?c1)))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Дрова("(* 0.86 ?c1)")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_1984
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_1984)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в 1984("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_пивко
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Пив_ко)(confidence (* 0.86 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в пивко("(* 0.86 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_пивноff
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Пивноff)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в пивноff("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Hops
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Hops)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Hops("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Чёрный_кот
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Чёрный_кот)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Чёрный кот("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Голодранец
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Голодранец)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Голодранец("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Добрый Эль("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Дрова("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Пинту("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Красного_Крокодила
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Красного Крокодила("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Есенина
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Есенин)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Есенина("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c2))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Немца Перца Колбасу("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_пришли_к_непривередливым_антикошатникам
(declare(salience 40))
(barParam(param Устроят_обычные_официанты)(confidence ?c1))
(barParam(param Кот_не_обязателен)(confidence ?c2))
(barParam(param Можно_посидеть_компанией)(confidence ?c3))
=>
(assert(barParam(param Непривередливая_компания_антикошатников)(confidence (* 0.97 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Мы пришли к непривередливым антикошатникам("(* 0.97 (min ?c1 ?c2 ?c3))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(param Непривитые_мерзляки-алкоголики)(confidence ?c1))
(barParam(param Непривередливая_компания_антикошатников)(confidence ?c2))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Дрова("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_пришли_к_страшному_человеку
(declare(salience 40))
(barParam(param Кальян_не_обязателен)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c3))
=>
(assert(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)(confidence (* 0.97 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Мы пришли к страшному человеку("(* 0.97 (min ?c1 ?c2 ?c3))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)(confidence ?c1))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Добрый Эль("(* 0.97 ?c1)")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)(confidence ?c1))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Пинту("(* 0.97 ?c1)")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)(confidence ?c1))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Немца Перца Колбасу("(* 0.97 ?c1)")"))))


(defrule Жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(param Есть_столики_на_улице)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c3))
=>
(assert(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить)(confidence (* 0.97 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Жаворонок-одиночка, который просто хочет накатить на свежем воздухе("(* 0.97 (min ?c1 ?c2 ?c3))")"))))


(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
=>
(assert(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе
(declare(salience 40))
(barParam(param Жаворонок-одиночка,_который_просто_хочет_накатить)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
=>
(assert(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый жаворонок-одиночка, который просто хочет накатить  на свежем воздухе("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Пинта
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Пинта("(* 0.97 ?c1)")"))))


(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Hops)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Hops("(* 0.97 ?c1)")"))))


(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Квадрюпель)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Квадрюпель("(* 0.97 ?c1)")"))))


(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Сияние
(declare(salience 40))
(barParam(param Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Сияние("(* 0.97 ?c1)")"))))


(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Hops)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Hops("(* 0.97 ?c1)")"))))


(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Пинта
(declare(salience 40))
(barParam(param Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе)(confidence ?c1))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Пинта("(* 0.97 ?c1)")"))))


(defrule Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице
(declare(salience 40))
(barParam(param Есть_столики_на_улице)(confidence ?c1))
(barParam(param Кальян_не_обязателен)(confidence ?c2))
(barParam(param Есть_кухня)(confidence ?c3))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c4))
=>
(assert(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице)(confidence (* 0.97 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Некурящий одинокий жаворонок, который хочет покушать на улице("(* 0.97 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Привитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице)(confidence ?c1))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c2))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Непривитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(param Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Непривитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём
(declare(salience 40))
(barParam(param Есть_столики_на_улице)(confidence ?c1))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c2))
(barParam(param Все_равно_проверяют_ли_QR-кода)(confidence ?c3))
(barParam(param Кот_не_обязателен)(confidence ?c4))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c5))
=>
(assert(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём)(confidence (* 0.97 (min ?c1 ?c2 ?c3 ?c4 ?c5)))))
(assert(appendmessagehalt (str-cat "Привитый футболохейтер, который хочет посидеть на свежем воздухе днём("(* 0.97 (min ?c1 ?c2 ?c3 ?c4 ?c5))")"))))


(defrule Привитый_некурящий_непривередливый_голодный_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём)(confidence ?c1))
(barParam(param Кальян_не_обязателен)(confidence ?c2))
(barParam(param Устроят_обычные_официанты)(confidence ?c3))
(barParam(param Есть_кухня)(confidence ?c4))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.97 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Привитый некурящий непривередливый голодный футболохейтер, который хочет посидеть на свежем воздухе днём => Сияние("(* 0.97 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Привитый_футболохейтер,_который_хочет_просто_выпить_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(param Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём)(confidence ?c1))
(barParam(param Милые_официанты)(confidence ?c2))
(barParam(param Зашли_просто_выпить)(confidence ?c3))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.97 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Привитый футболохейтер, который хочет просто выпить на свежем воздухе днём => Сияние("(* 0.97 (min ?c1 ?c2 ?c3))")"))))


(defrule Непривитые_мерзляки
(declare(salience 40))
(barParam(param Нет_столиков_на_улице)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
=>
(assert(barParam(param Непривитые_мерзляки)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Непривитые мерзляки("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Непривитые_мерзляки-алкоголики
(declare(salience 40))
(barParam(param Непривитые_мерзляки)(confidence ?c1))
(barParam(param Зашли_просто_выпить)(confidence ?c2))
=>
(assert(barParam(param Непривитые_мерзляки-алкоголики)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Непривитые мерзляки-алкоголики("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_предварительно_пришли_по_фичам_в_Красный_Крокодил
(declare(salience 40))
(barParam(param Голодный_cоцио-_и_котофоб,_которому_рано_вставать)(confidence ?c1))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c2))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы предварительно пришли по фичам в Красный Крокодил("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_дошли_до_зожника_с_прибабахом
(declare(salience 40))
(barParam(param Кальян_не_обязателен)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Социо-_и_котофоб,_которому_рано_вставать)(confidence ?c3))
=>
(assert(barParam(param Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence (* 0.97 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Мы дошли до зожника с прибабахом("(* 0.97 (min ?c1 ?c2 ?c3))")"))))


(defrule Мы_дошли_до_непривередливого_антикошатника
(declare(salience 40))
(barParam(param Кот_не_обязателен)(confidence ?c1))
(barParam(param Устроят_обычные_официанты)(confidence ?c2))
=>
(assert(barParam(param Непривередливый_антикошатник)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы дошли до непривередливого антикошатника("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_пришли_к_очередному_клерку
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c2))
=>
(assert(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы пришли к очередному клерку("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Мы_пришли_к_привитому_непривередливому_антикошатнику
(declare(salience 40))
(barParam(param Привитый)(confidence ?c1))
(barParam(param Непривередливый_антикошатник)(confidence ?c2))
=>
(assert(barParam(param Привитый_непривередливый_антикошатник)(confidence (* 0.97 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мы пришли к привитому непривередливому антикошатнику("(* 0.97 (min ?c1 ?c2))")"))))


(defrule Бар_Сияние
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Сияние("(* 0.97 ?c1)")"))))


(defrule Бар_London_Pub
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_London_Pub)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Бар London Pub("(* 0.97 ?c1)")"))))


(defrule Бар_Коррида
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Коррида)(confidence (* 0.97 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Коррида("(* 0.97 ?c1)")"))))


(defrule Бар_Свой_Бар
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Свой_Бар)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Свой Бар("(* 0.78 ?c1)")"))))


(defrule Бар_Свой_Бар_
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_Свой_Бар)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Свой Бар ("(* 0.78 ?c1)")"))))


(defrule Бар_Mozart_Wine_House
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Mozart_Wine_House)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Mozart Wine House("(* 0.78 ?c1)")"))))


(defrule Бар_Пинта
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Пинта)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Пинта("(* 0.78 ?c1)")"))))


(defrule Бар_Дрова
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник)(confidence ?c1))
(barParam(param Можно_посидеть_компанией)(confidence ?c2))
(barParam(param Зашли_просто_выпить)(confidence ?c3))
=>
(assert(barParam(param Бар_Дрова)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Дрова("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян)(confidence ?c1))
(barParam(param Отмечаем_что-то)(confidence ?c2))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.78 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Бар O.W.Grant("(* 0.78 (min ?c1 ?c2))")"))))


(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Красный Крокодил("(* 0.78 ?c1)")"))))


(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать_до_утра)(confidence ?c1))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар O.W.Grant("(* 0.78 ?c1)")"))))


(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Красный Крокодил("(* 0.78 ?c1)")"))))


(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence ?c1))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар O.W.Grant("(* 0.78 ?c1)")"))))


(defrule Бар_St._Patrick’s_Pub
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_St._Patrick’s_Pub)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар St. Patrick’s Pub("(* 0.78 ?c1)")"))))


(defrule Бар_Коррида
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Коррида)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Коррида("(* 0.78 ?c1)")"))))


(defrule Бар_Мистер_Fox
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Мистер_Fox)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Мистер Fox("(* 0.78 ?c1)")"))))


(defrule Бар_Mojo
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Mojo)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Mojo("(* 0.78 ?c1)")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
(barParam(param Есть_кухня)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано)(confidence ?c1))
(barParam(param Кухня_не_обязательна)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Есть_кальян)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Кухня_не_обязательна)(confidence ?c2))
(barParam(param Есть_кальян)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Кухня_не_обязательна)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(param Привитый_непривередливый_игрок_в_кикер)(confidence ?c1))
(barParam(param Есть_кухня)(confidence ?c2))
(barParam(param Кальян_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Бар_Эйнштейн)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Бар Эйнштейн("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Бар_Сияние
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Сияние)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Сияние("(* 0.78 ?c1)")"))))


(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_O.W.Grant)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар O.W.Grant("(* 0.78 ?c1)")"))))


(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Красный_Крокодил)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Красный Крокодил("(* 0.78 ?c1)")"))))


(defrule Бар_London_Pub
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_London_Pub)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар London Pub("(* 0.78 ?c1)")"))))


(defrule Бар_Добрый_Эль
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Добрый_Эль)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Добрый Эль("(* 0.78 ?c1)")"))))


(defrule Бар_Немец_Перец_Колбаса
(declare(salience 40))
(barParam(param Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)(confidence ?c1))
=>
(assert(barParam(param Бар_Немец_Перец_Колбаса)(confidence (* 0.78 ?c1)))
(assert(appendmessagehalt (str-cat "Бар Немец Перец Колбаса("(* 0.78 ?c1)")"))))


(defrule Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян
(declare(salience 40))
(barParam(param Привитый_непривередливый_антикошатник)(confidence ?c1))
(barParam(param Кальян_не_обязателен)(confidence ?c2))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c3))
=>
(assert(barParam(param Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян)(confidence (* 0.78 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Привитый непривередливый антикошатник, не играющий в кикер и не курящий кальян("(* 0.78 (min ?c1 ?c2 ?c3))")"))))


(defrule Пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Милые_официанты)(confidence ?c1))
(barParam(param Настольный_футбол_не_обязателен)(confidence ?c2))
(barParam(param Кот_не_обязателен)(confidence ?c3))
(barParam(param Зашли_просто_выпить)(confidence ?c4))
=>
(assert(barParam(param Пришли_выпить_и_поболтать)(confidence (* 0.73 (min ?c1 ?c2 ?c3 ?c4)))))
(assert(appendmessagehalt (str-cat "Пришли выпить и поболтать("(* 0.73 (min ?c1 ?c2 ?c3 ?c4))")"))))


(defrule Привитые_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Привитый)(confidence ?c2))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать)(confidence (* 0.73 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитые пришли выпить и поболтать("(* 0.73 (min ?c1 ?c2))")"))))


(defrule Привитые_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать_до_закрытия)(confidence (* 0.73 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитые пришли выпить и поболтать до закрытия("(* 0.73 (min ?c1 ?c2))")"))))


(defrule Привитые_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(param Привитые_пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Привитые_пришли_выпить_и_поболтать_до_утра)(confidence (* 0.73 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Привитые пришли выпить и поболтать до утра("(* 0.73 (min ?c1 ?c2))")"))))


(defrule Мерзляки_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(param Пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Нет_столиков_на_улице)(confidence ?c2))
=>
(assert(barParam(param Мерзляки_пришли_выпить_и_поболтать)(confidence (* 0.73 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мерзляки пришли выпить и поболтать("(* 0.73 (min ?c1 ?c2))")"))))


(defrule Мерзляки_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Можно_сидеть_после_закрытия)(confidence ?c2))
=>
(assert(barParam(param Мерзляки_пришли_выпить_и_поболтать_до_утра)(confidence (* 0.73 (min ?c1 ?c2)))))
(assert(appendmessagehalt (str-cat "Мерзляки пришли выпить и поболтать до утра("(* 0.73 (min ?c1 ?c2))")"))))


(defrule Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(param Мерзляки_пришли_выпить_и_поболтать)(confidence ?c1))
(barParam(param Не_требуется_QR-код)(confidence ?c2))
(barParam(param Нет_необходимости_сидеть_после_закрытия)(confidence ?c3))
=>
(assert(barParam(param Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия)(confidence (* 0.73 (min ?c1 ?c2 ?c3)))))
(assert(appendmessagehalt (str-cat "Непривитые мерзляки пришли выпить и поболтать до закрытия("(* 0.73 (min ?c1 ?c2 ?c3))")"))))


