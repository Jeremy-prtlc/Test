#include "mainactivity.h"

MainActivity::MainActivity(QList<Wtemp*>* list)
    : list(list) {
}

void MainActivity::findWtemp(QString path, QStringList filter) {
    // set dir iterator
    QDirIterator dit(
                path,
                filter,
                QDir::Files|QDir::Readable|QDir::NoSymLinks|QDir::NoDotAndDotDot,
                QDirIterator::Subdirectories);

    while(dit.hasNext()) {
        dit.next();
        if(dit.filePath().endsWith(".album")) {
            list->append(new Album(dit.filePath()));
        }
        else {
            list->append(new Wtemp(dit.filePath()));
        }
    }
}

QString MainActivity::listToString () {
    QString tmp;
    QListIterator<Wtemp*> lit(*list);
    while(lit.hasNext()) {
        tmp.append(lit.next()->getSrc()).append("\n");
    }
    return tmp;
}

QList<Wtemp*>* MainActivity::getList() {
    return list;
}
