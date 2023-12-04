Задание 

Операционные системы и виртуализация (Linux)

1. Использование команды cat в Linux
   - Создать два текстовых файла: "Pets"(Домашние животные) и "Pack animals"(вьючные животные), используя команду `cat` в терминале Linux. В первом файле перечислить собак, кошек и хомяков. Во втором — лошадей, верблюдов и ослов.
   - Объединить содержимое этих двух файлов в один и просмотреть его содержимое.
   - Переименовать получившийся файл в "Human Friends"(.
Пример конечного вывода после команды “ls” :
Desktop Documents Downloads  HumanFriends.txt  Music  PackAnimals.txt  Pets.txt  Pictures  Videos

Приступаем
С помощью команды cat создадим два текстовых файла: "Pets"(Домашние животные) и "Pack animals"(вьючные животные). 
В первом файле перечислим собак, кошек и хомяков. 
Во втором — лошадей, верблюдов и ослов.

![Model](IMAGES/linux/1.jpg )

1.1. Объединим содержимое этих двух файлов в один. Затем переименуем получившийся файл командой mv в "Human Friends" 
и просмотрим его содержимое командой cat. 
![Model](IMAGES/linux/2.jpg )

1.2. Создадим новую директорию folder и переместим туда файл "Human Friends".
![Model](IMAGES/linux/3.jpg )

1.3. Установим и настроим MySQL на Linux Ubuntu 22.04.1 используя следующую команду:
![Model](IMAGES/linux/4.jpg )


1.4 Зайдём на сайт dev.mysql.com и найдем там название deb пакета MySQL APT Repository:
![Model](IMAGES/linux/5.jpg )
1.4.1 Скопируем название файла пакета deb и с помощью команды wget скачаем данный пакет в нашу текущую директорию. Установим скаченный пакет deb
![Model](IMAGES/linux/6.jpg )
1.4.2 и затем удалим его с помощью команды dpkg:
![Model](IMAGES/linux/7.jpg )
![Model](IMAGES/linux/7.jpg )


