#include "wtemp.h"

Wtemp::Wtemp(QObject *parent) : QObject(parent) {}

Wtemp::Wtemp(QString src) {
    this->src = src;
    this->name = src; // remove the suffix extension : TODO
}

QString Wtemp::getSrc() {
    return src;
}

QString Wtemp::getName() {
    return name; // only the prefix without extension (i.e: *.Wtemp)
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
WtempModel::WtempModel(QObject *parent) : QAbstractListModel(parent) {
     QMap<int, QByteArray> roles;
     roles[SrcRole] = "src";
     //setItemData(0, roles);
 }

void WtempModel::addWtemp(const Wtemp &wtemp) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_wtemp << wtemp;
    endInsertRows();
}

int WtempModel::rowCount(const QModelIndex &parent) const {
    return m_wtemp.count();
}

QVariant WtempModel::data(const QModelIndex &index, int role) const {
    if(index.row() < 0 || index.row() > m_wtemp.count()) {
        return QVariant();
    }
    Wtemp wtemp = m_wtemp[index.row()];
    if(role == SrcRole) {
        return wtemp.getSrc();
    }
    return QVariant();
 }
