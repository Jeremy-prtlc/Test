#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "mainactivity.h"
#include <QQmlContext>


int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Test/MainActivity.qml"));
    viewer.showExpanded();

    // Instancie un objet MainActivity et sauvegarde dedans la racine du QML.
    // Instancie également dans l'objet une liste, contenant (dans le futur) les images.
    MainActivity* main = new MainActivity(viewer.rootObject());

    // parcours les dossiers et récupère les fichiers à partir du chemin et filtre précisé
    main->findWtemp("../Test/", (QStringList() << "*.jpg" << "*.png" << "*.bmp" << "*.gif"));

    // affiche dans le log le contenue de la liste des images trouvées.
    qDebug() << main->listToString();
    qDebug() << main->getRoot()->objectName();


    WtempModel wtempModel;
    // crée un itérateur sur la liste des images
    QListIterator<Wtemp*> qlitw(*main->getList());
    while(qlitw.hasNext()) {
        // ajoute pour chaque image un : ListElement { src: <.next().getSrc<QString>()> }
        wtempModel.addWtemp(Wtemp(qlitw.next()->getSrc()));
    }
    // ajoute notre model au root (context)
    viewer.rootContext()->setContextProperty ("listModelModel_galleryGridListView_mainLayout", &wtempModel);
    // cherche l'élément QML multiView_mainLayout
    main->getRoot()
            ->findChild<QQuickView*>("multiView_mainLayout")
            ->setProperty("model", QVariant::fromValue((QString)"listModelModel_galleryGridListView_mainLayout"));

    /** TODO :
     * ajouter les images récupérées dans la liste à la GridView du layout (via ListModel->ListElement)
     * ajouter la gestion de l'affichage : liste, grille, galerie au layout
     **/

    return app.exec();
}
