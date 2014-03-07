#ifndef MAINACTIVITY_H
#define MAINACTIVITY_H

#include "album.h"
#include <QDirIterator>

class MainActivity {

public:
    MainActivity(QList<Wtemp*>* list = new QList<Wtemp*>());
    void findWtemp(
            QString path = "./",
            QStringList filter = (QStringList() << "*.wtemp"));
    QString listToString();
    QList<Wtemp*>* getList();

private:
    QList<Wtemp*>* list;

};

#endif // MAINACTIVITY_H
