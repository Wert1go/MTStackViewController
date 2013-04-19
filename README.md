MTStackViewController
=====================

`MTStackViewController` is a container view controller which mimics the navigation patterns found in apps such as Path and Facebook.

Instead of providing a UITableView interface for the left or right view controllers, `MTStackViewController` lets you
specify the `UIViewController` instances to be used. `MTStackViewController` adds a property `stackViewController` to your
`UIViewController` instances, allowing you to interact with it however you like.

Installation
=========

Проект необходимо добавлять как сабмодуль, для этого нужно провести следующие операции:

В терминале зайти в папку проекта, и выполнить следующую команду:

git submodule add git://github.com/Wert1go/MTStackViewController.git Submodules/APStackViewController

После завершения загрузки, нужно зайти в папку APStackViewController, и добавить все файлы из папок Classes и Resources в проект.

Все, можно работать.


Documentaion
============

For the time being, please refer to the [well documented header](https://github.com/willowtreeapps/MTStackViewController/blob/master/Classes/MTStackViewController.h).

Форк проекта, для локальных нужд (пока публичный).

При работе небходимо использовать ТОЛЬКО классы, которые начинаются с приставки AP (даже есть класс пустой). Это необходимо для гибкости при дальнейшей разработке проекта.

Краткая перепись классов для использования:

* APStackViewController
* APStackViewControllerConfig
* APMenuViewController
* APMenuViewControllerConfig
* APMenuTableCell
* APMenuTableHeader

Все классы номинальные наследники оригинальных классов. В базовые классы были внесены достаточные изменения для работы.

Все классы, используемые в проектах должны наследоваться ТОЛЬКО от классов перечисленных в списке выше.

Для поддержания возможности нормального обновления все кастомные изменения вносятся ТОЛЬКО в классы наследники.

Example
=======

Please see the [Example](https://github.com/willowtreeapps/MTStackViewController/tree/master/Example) directory for an example Xcode project that uses `MTStackViewController`.

License
=======
MTStackViewController is available under the MIT license. See the [LICENSE](https://github.com/willowtreeapps/MTStackViewController/blob/master/LICENSE) file for more info.
