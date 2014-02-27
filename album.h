#ifndef ALBUM_H
#define ALBUM_H

#include "wtemp.h"
#include <QStringListIterator>

class Album : public Wtemp {

public:
    explicit Album(QString src, QList<QString>* list = new QList<QString>());
    void add(QString s);
    bool remove(QString s);
    void clear();
    int size();
    QString listToString();

private:
    QList<QString>* list;

};

#endif // ALBUM_H
