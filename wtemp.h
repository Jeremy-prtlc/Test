#ifndef WTEMP_H
#define WTEMP_H

#include <QObject>
#include <QQuickItem>
#include <QAbstractListModel>

class Wtemp {

public:
    explicit Wtemp(QString src);
    QString getSrc();
    void setSrc(const QString src);
    void setName(const QString name);
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
class WtempModel : public QAbstractListModel {
     Q_OBJECT

public:
     enum WtempRoles { SrcRole };

     explicit WtempModel(QObject *parent = 0);
     WtempModel(QList<Wtemp*> *list, QObject *parent = 0);
     ~WtempModel();

     QHash<int, QByteArray> roleNames() const;
     bool addWtemp(Wtemp *wtemp);
     bool removeWtemp(Wtemp *wtemp);
     int rowCount(const QModelIndex &parent = QModelIndex()) const;
     QVariant data(const QModelIndex &index, int role) const;
     bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
     int size();
     QVariant get(const int i);

private:
     QList<Wtemp*> *list_element;
};

#endif // WTEMP_H
