#include "wtemp.h"

Wtemp::Wtemp(QString src) : src(src) {
    /**
      * TODO:
      * remove the prefix path.
      **/
    this->name = src;
}

QString Wtemp::getSrc() {
    return src;
}

void Wtemp::setSrc(const QString src) {
    this->src = src;
}

QString Wtemp::getName() {
    return name; // only the prefix without extension (i.e: *.Wtemp)
}

void Wtemp::setName(const QString name) {
    this->name = name;
}

int Wtemp::length() {
    return src.length();
}

QString Wtemp::toString() {
    return src;
}

/********************************
 * Source code of Wtemp' Model *
 ********************************/
WtempModel::WtempModel(QObject *parent)
    : QAbstractListModel(parent) {
}

WtempModel::WtempModel(QList<Wtemp*> *list, QObject *parent)
    : QAbstractListModel(parent), list_element(list) {
}

WtempModel::~WtempModel() {
}

QHash<int, QByteArray> WtempModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[SrcRole] = "src";
    return roles;
}

bool WtempModel::addWtemp(Wtemp *wtemp) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    list_element->append(wtemp);
    endInsertRows();
    return true;
}

bool WtempModel::removeWtemp(Wtemp *wtemp) {
    return list_element->removeOne(wtemp);
}

int WtempModel::rowCount(const QModelIndex &parent) const {
    if(parent.isValid()) {
        return 0;
    }
    return list_element->count();
}

QVariant WtempModel::data(const QModelIndex &index, int role) const {
    if(index.row() < 0 || index.row() > list_element->count()) {
        return QVariant();
    }
    if(role == Qt::DisplayRole) {
        return list_element->at(index.row())->getSrc();
    }
    return QVariant();
}

bool WtempModel::setData(const QModelIndex &index, const QVariant &value, int role) {
    if (index.row() >= 0
            && index.row() < list_element->size()
            && (role == Qt::EditRole || role == Qt::DisplayRole)) {
        list_element->at(index.row())->setSrc(value.toString());
        emit dataChanged(index, index);
        return true;
    }
    return false;
}
