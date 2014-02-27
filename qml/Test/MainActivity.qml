import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: mainLayout
    objectName: "mainLayout"
    width: 320
    height: 480
    color: "#000000"
    border.width: 0
    border.color: "#000000"

    Image {
        id: backArrow_mainLayout
        objectName: "backArrow_mainLayout"
        width: 20
        height: 40
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "../../res/leftarrow.png"
    }

    Image {
        id: logo_mainLayout
        objectName: "logo_mainLayout"
        width: backArrow_mainLayout * 2
        height: backArrow_mainLayout.height
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../res/wtemp.png"
    }

    MouseArea {
        id: backArrowListener_mainLayout
        objectName: "backArrowListener_mainLayout"
        width: backArrow_mainLayout.width + logo_mainLayout.width
        height: backArrow_mainLayout.height
        visible: true
        anchors.left: backArrow_mainLayout.left
        anchors.leftMargin: 0
        anchors.top: backArrow_mainLayout.top
        anchors.topMargin: 0
        anchors.right: logo_mainLayout.right
        anchors.rightMargin: 0
        hoverEnabled: true
        onClicked: {
            Qt.quit()
        }
    }

    Text {
        id: appName_mainLayout
        objectName: "appName_mainLayout"
        width: mainLayout.width - (backArrow_mainLayout.width + logo_mainLayout.width + iconGallery_mainLayout.width)
        height: logo_mainLayout.height
        color: "#2f4eb7"
        text: qsTr("Name")
        font.bold: false
        font.family: "Verdana"
        style: Text.Normal
        styleColor: "#3d5db8"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: logo_mainLayout.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 0
        font.pixelSize: 12
    }

    Image {
        id: iconGallery_mainLayout
        objectName: "iconGallery_mainLayout"
        x: 460
        width: logo_mainLayout.width
        height: logo_mainLayout.height
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 20
        fillMode: Image.PreserveAspectFit
        source: "../../res/gallery.png"
    }

    MouseArea {
        id: iconGalleryListener_mainLayout
        objectName: "iconGalleryListener_mainLayout"
        x: 260
        width: iconGallery_mainLayout.width
        height: iconGallery_mainLayout.height
        anchors.top: iconGallery_mainLayout.top
        anchors.topMargin: 0
        anchors.right: iconGallery_mainLayout.right
        anchors.rightMargin: 0
        onClicked: {
            listViewGallery_mainLayout.visible = !listViewGallery_mainLayout.visible
        }
    }

    ListView {
        id: listViewGallery_mainLayout
        objectName: "listViewGallery_mainLayout"
        x: 226
        width: 80
        height: 60
        z: 100
        spacing: 0
        snapMode: ListView.NoSnap
        keyNavigationWraps: false
        flickableDirection: Flickable.AutoFlickDirection
        visible: false
        anchors.top: iconGallery_mainLayout.bottom
        anchors.topMargin: 0
        anchors.right: iconGallery_mainLayout.right
        anchors.rightMargin: 0
        ExclusiveGroup { id: exclusiveGroup_radioButton_itemDelegate_listViewGallery_mainLayout }
        delegate: Item {
            id: itemDelegate_listViewGallery_mainLayout
            objectName: "itemDelegate_listViewGallery_mainLayout"
            x: 0
            width: 80
            height: 20
            RadioButton {
                id: radioButton_itemDelegate_listViewGallery_mainLayout
                objectName: "radioButton_itemDelegate_listViewGallery_mainLayout"
                exclusiveGroup: exclusiveGroup_radioButton_itemDelegate_listViewGallery_mainLayout
                width: 20
                height: 20
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                activeFocusOnPress: true
                checked: false | text_itemDelegate_listViewGallery_mainLayout.focus
                onClicked: {
                    listViewGallery_mainLayout.visible = false
                }
            }
            Text {
                id: text_itemDelegate_listViewGallery_mainLayout
                objectName: "text_itemDelegate_listViewGallery_mainLayout"
                width: 60
                height: 20
                color: "#2f4eb7"
                text: qsTr(name)
                font.bold: false
                font.family: "Verdana"
                style: Text.Normal
                styleColor: "#3d5db8"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.left: radioButton_itemDelegate_listViewGallery_mainLayout.right
                anchors.leftMargin: 0
                anchors.top: radioButton_itemDelegate_listViewGallery_mainLayout.top
                anchors.topMargin: 0
                font.pixelSize: 12
            }
        }
        model: ListModel {
            id: listModelModel_listViewGallery_mainLayout
            objectName: "listModelModel_listViewGallery_mainLayout"
            ListElement {
                name: "Gallery"
            }
            ListElement {
                name: "Grid"
            }
            ListElement {
                name: "List"
            }
        }
    }

    ListModel {
        id: listModelModel_galleryGridListView_mainLayout
        objectName: "listModelModel_galleryGridListView_mainLayout"
    }

    Component {
        id: componentDelegate_galleryGridListView_mainLayout
        Item {
            id: item_componentDelegate_galleryGridListView_mainLayout
            objectName: "item_componentDelegate_galleryGridListView_mainLayout"
            width: multiView_mainLayout.cellWidth
            height: multiView_mainLayout.cellHeight
            Image {
                id: image_item_componentDelegate_galleryGridListView_mainLayout
                objectName: "image_item_componentDelegate_galleryGridListView_mainLayout"
                width: parent.width
                height: parent.height
                visible: true
                anchors.left: item_componentDelegate_galleryGridListView_mainLayout.left
                anchors.leftMargin: 0
                anchors.top: item_componentDelegate_galleryGridListView_mainLayout.top
                anchors.topMargin: 0
                source: src
            }
        }
    }

    /********************************************************************
     * Auto-généré par le C++,
     * peut-être une  : ListView  GridView  PathView   GridView(custom)
     * respectivement : liste     grille    exploreur  galerie
     **/
    GridView {
        id: multiView_mainLayout
        objectName: "multiView_mainLayout"
        contentHeight: 70
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: logo_mainLayout.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        cellWidth: parent.width/4
        cellHeight: cellWidth
        model: listModelModel_galleryGridListView_mainLayout
        delegate: componentDelegate_galleryGridListView_mainLayout
    }
    /********************************************************************/
}
