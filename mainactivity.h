#ifndef MAINACTIVITY_H
#define MAINACTIVITY_H

#include "album.h"
#include <QDirIterator>

class MainActivity {

public:
    MainActivity(QQuickItem* root, QList<Wtemp*>* list = new QList<Wtemp*>());
    void findWtemp(
            QString path = "./",
            QStringList filter = (QStringList() << "*.wtemp"));
    QString listToString();
    QQuickItem* getRoot();
    QList<Wtemp*>* getList();

private:
    QQuickItem* root;
    QList<Wtemp*>* list;

};

#endif // MAINACTIVITY_H
