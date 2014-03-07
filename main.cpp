#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include "mainactivity.h"
#include <QQmlContext>


int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;

    // Instancie la liste des images.
    MainActivity* main = new MainActivity();
    // parcours le dossier path et récupère les fichiers à partir du chemin et filtre précisé.
    main->findWtemp("../Test", (QStringList() << "*.jpg" << "*.png" << "*.bmp" << "*.gif"));
    // affiche dans le log le contenue de la liste des images trouvées.
    qDebug() << main->listToString();

    WtempModel *wtempModel = new WtempModel(main->getList());
/*    // crée un itérateur sur la liste des images
    QListIterator<Wtemp*> qlitw(main->getList());
    while(qlitw.hasNext()) {
        // ajoute pour chaque image un : ListElement { src: "getSrc<QString>()" }
        wtempModel.addWtemp(Wtemp(qlitw.next()->getSrc()));
    }
*/
    // ajoute notre model au root (context)
    viewer.rootContext()->setContextProperty("listModelModel_galleryGridListView_mainLayout", wtempModel);
    // définie le QML principal
    viewer.setMainQmlFile(QStringLiteral("qml/Test/MainActivity.qml"));
    // permet l'affichage du QML
    viewer.showExpanded();

    /** TODO :
     * ajouter la gestion de l'affichage : liste, grille, galerie au layout
     **/

    return app.exec();
}
