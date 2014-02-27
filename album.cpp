#include "album.h"

Album::Album(QString src, QList<QString>* list) : Wtemp(src) {
    this->list = list;
}

void Album::add(QString s) {
    list->append(s);
}

bool Album::remove(QString s) {
    return list->removeOne(s);
}

void Album::clear() {
    list->clear();
}

int Album::size() {
    return list->size();
}

QString Album::listToString() {
    QString tmp;
    QStringListIterator lit(*list);
    while(lit.hasNext()) {
        tmp.append(lit.next()).append("\n");
    }
    return tmp;
}
