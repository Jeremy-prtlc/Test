README - WtempViewer
================================
README retraçant le travail effectué durant Février-Mars 2014 concernant la réalisation de l'application cross-platform destinée à visualiser les images de types **`Wtemp`**. Ce document expliquera les choix qui ont été fait, pourquoi et comment ils ont été implémentés.


Description
-----------
L'application **`WtempViewer`** est un visualiseur d'images parcourant le répertoires local de l'utilisateur à la recherche des fichiers image d'extension **`Wtemp`**. L'application doit permettre d'afficher des miniatures de toutes les images récupérées sous formes d'une galerie, grille ou liste. Sélectionner une miniature doit afficher l'image originale en plein écran. L'application native n'intégre pas de fonctionnalités supplémentaires comme le redimmensionnement, la retouche d'image, etc...
*A termes certaines de ces fonctionnalités pourront être ajoutées.*


Etat actuel du projet
---------------------
L'application est capable de rechercher récursivement les images situées dans un répertoire donné. Le type d'image recherchée est **`jpg`**, **`png`**, **`bmp`**, **`gif`**, **`wtemp`**. Elle affiche leur miniature sous forme d'une grille sur l'écran principal. Elle n'affiche pas l'image originale en plein écran à la sélection. Un bouton pour fermer l'application est implémenté, ainsi qu'un bouton radio non fonctionnel permettant de choisir le mode d'affichage : galerie, liste, grille. L'affichage se fait uniquement en grille à ce niveau du développement.


Hiérarchie du projet
--------------------
- Test.pro
- qtquick2applicationviewer/
    - qtquick2appliationviewer.pri
    - qtquick2applicationviewer.cpp
    - qtquick2applicationviewer.h
- wtemp.cpp
- wtemp.h
- mainactivity.cpp
- mainactivity.h
- album.cpp
- album.h
- main.cpp
- qml/
    - main.qml
    - MainActivity.qml
- android/
    - res/
        - drawable-mdpi/icon.png
        - drawable-ldpi/icon.png
        - drawable-hdpi/icon.png
    - AndroidManifest.xml
- res/
    - pictures/
        - /* some pictures provided to test application */
    - downloads/
        - /* some pictures provided to test application */
    - wtemp.png
    - leftarrow.png
    - gallery.png
    - README - WtempViewer.md


Descriptions des fichiers
-------------------------
**`Test.pro`**
Fichier de configuration du projet. Définit les répertoires/fichiers à exporter avec le projet lors du déploiement. Définit les fichiers sources et d'en-tête avec leur chemin relatif à la racine du projet. Définit également tous les fichiers classés "Other files" à ajouter au projet.

**`qtquick2applicationviewer`**
Ce répertoire contient trois fichiers éponymes d'extensions : .cpp, .h et .pri. Ils sont introduis automatiquements par Qt et sont nécessaires au déploiement de l'application. A modifier en connaissance de cause.

**`Wtemp`**
Cette classe est définie en deux fichiers : source et en-tête (wtemp.cpp, wtemp.h). Elle intégre deux attributs QString (path et name) qui correspondent respectivement au chemin relatif (ou absolue) et au nom de l'image. Elle possède le constructeur et les accesseurs habituels.
*Ces fichiers intégre également une classe WtempModel.*

**`WtempModel`**
Cette classe définie dans les fichiers wtemp.cpp et wtemp.h hérite de la classe QAbstractListModel. Elle permet la création d'un ListModel utilisé en QML afin de remplir automatiquement une vue graphique de type GridView, ListView ou PathView.
Pour ce faire, elle doit ré-implémenter les méthodes héritées de QAbstractListModel :
```CPP
public:
    explicit WtempModel(QObject *parent = 0);
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role) const;
    bool setData(const QModelIndex & index, const QVariant & value, int role = Qt::EditRole);
```
définir un ou plusieurs rôles :
```CPP
public:
    enum WtempRoles { SrcRole };
```
implémenter deux fonctions d'ajout et de suppression :
```CPP
public:
    bool addWtemp(Wtemp *wtemp);
    bool removeWtemp(Wtemp *wtemp);
```
et définir un attribut contenant la liste des éléments de la ListModel (voir ListElement) :
```CPP
private:
    QList<Wtemp*> *list_element;
```

**`Album`**
Cette classe hérite de la classe Wtemp. Elle possède donc deux attributs QString (name et path) hérités. Elle possède également un attribut contenant la liste des images que l'album contient donc une liste de Wtemp. Elle implémente les méthodes basiques d'ajout, suppression, vidange et size d'une liste, ainsi qu'une méthode d'affichage console.
Elle est composée des deux fichiers source et en-tête : album.cpp et album.h.

**`MainAcitivity`**
Cette classe définie l'activité (au sens Android) principale de l'application. Il s'agit du backend associé au fichier QML éponyme définissant l'interface graphique de l'activité principale. Elle contient un attribut listant les images trouvées dans le répertoire local de l'utilisateur (ou dans un répertoire spécifié).
Les images sont retrouvées grâce à la méthode :
```CPP
public:
    void findWtemp(
            QString path = "./",
            QStringList filter = (QStringList() << "*.wtemp"));
```
qui prend en paramètres un répertoire de recherche et un filtre contenant les types d'images à rechercher. La recherche est faite récursivement à travers tous les dossiers et sous-dossiers du répertoire donné. Les images trouvées sont ajoutées à l'attribut liste.
Cette classe est composée des deux fichiers source et en-tête : mainactivity.cpp et mainactivity.h.

**`Main`**
Fichier c++ de lancement du programme. Lance la recherche des images au démarrage de l'application puis définie la ListModel en fonction de cette liste d'images récupérée et l'ajoute au contexte QML. Définie ensuite le QML principal et lance l'affichage.

**`main.qml`**
Ancien fichiers QML principal. Inutilisé dans le programme.

**`MainActivity.qml`**
Nouveau fichier QML principal. Définie l'interface graphique utilisateur de l'activité principale.

**`AndroidManifest.xml`**
Fichiers de configuration principal d'Android.
Définie les uses-sdk (target, max, min) utilisés pour le déploiement de l'applciation.
Définie les propriétés des activités de l'application : nom, orientation, etc...
Définie les permissions de l'application : external storage read/write, global search, etc...

**`Android ressources`**
Contient les dossiers avec les différentes résolutions de l'image de l'application.

**`Project ressources`**
Contient les images nécessaires au fonctionnement de l'application, comme le logo, les boutons, etc...
Contient également une panoplie d'images tests permettant de vérifier le bon fonctionnement de l'application.


Configuration
-------------
 1. Télécharger [Qt 5.2.1 for Android (Win32)][1] *(ou une autre version sur [Qt Project downloads][2])*
 2. Lancer le client d'installation (.exe)
 3. A l'étape de sélection des composants, vérifier que les options Android soient bien cochées. ![Qt install wizard @ component selection setup][3]


Notes
-----
L'application est stable en déploiement debug et release sur Desktop.
L'application est stable en déploiement release sur Android armeabi-v7a.
Les API supportées sont :
| API level | Version number | Nom de code | |
| :-------: | :------------: | ----------- |-:|
| 11 | 3.0 | Honeycomb | *`minimale`* |
| 12 | 3.1 | Honeycomb_MR1 |
| 13 | 3.2 | Honeycomb_MR2 |
| 14 | 4.0 | ICS |
| 15 | 4.0.3 | ICS_MR1 |
| 16 | 4.1 | JellyBean |
| 17 | 4.2 | JellyBean_MR1 |
| 18 | 4.3 | JellyBean_MR2 |
| 19 | 4.4 | KitKat | *`cible`* *`maximale`*


  [1]: http://download.qt-project.org/official_releases/qt/5.2/5.2.1/qt-opensource-windows-x86-android-5.2.1.exe "Qt 5.2.1 for Android (Windows 32bits, 1.1GB)"
  [2]: http://qt-project.org/downloads "Qt Project downloads"
  [3]: ./QtInstall_SelectComponentSetup.png "Qt Install SelectComponent Setup"