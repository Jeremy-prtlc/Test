#ifndef WTEMP_H
#define WTEMP_H

#include <QObject>
#include <QQuickItem>
#include <QAbstractListModel>

class Wtemp {

public:
    explicit Wtemp(QString src);
    QString getSrc();
    QString getName();
    int length();
    QString toString();

private:
    QString src;
    QString name;

};

/***************************
 * Header of Wtemp' Model *
 ***************************/
class WtempModel : public QAbstractListModel
 {
     Q_OBJECT

public:
     enum WtempRoles { SrcRole };

     WtempModel(QObject *parent = 0);

     void addWtemp(const Wtemp &wtemp);

     int rowCount(const QModelIndex &parent = QModelIndex()) const;

     QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

 private:
     QList<Wtemp> m_wtemp;
 };

#endif // WTEMP_H
