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
        width: mainLayout.width * 8/100
        height: width*2
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
        width: backArrow_mainLayout.height
        height: width
        anchors.left: backArrow_mainLayout.right
        anchors.leftMargin: 0
        anchors.top: backArrow_mainLayout.top
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

    Image {
        id: iconGallery_mainLayout
        objectName: "iconGallery_mainLayout"
        /*x: 460*/
        width: logo_mainLayout.width
        height: logo_mainLayout.height
        anchors.top: logo_mainLayout.top
        anchors.topMargin: 0
        anchors.right: mainLayout.right
        anchors.rightMargin: 0
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
            listViewGalleryBackground_mainLayout.visible = !listViewGalleryBackground_mainLayout.visible
        }
    }

    Text {
        id: appName_mainLayout
        objectName: "appName_mainLayout"
        width: mainLayout.width - (backArrowListener_mainLayout.width + iconGalleryListener_mainLayout.width + anchors.leftMargin)
        height: logo_mainLayout.height
        color: "#307dd7"
        text: qsTr("WtempViewer Cross-platform app")
        font.bold: false
        font.family: "Verdana"
        style: Text.Normal
        styleColor: "#3d5db8"
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: logo_mainLayout.right
        anchors.leftMargin: 10
        anchors.top: logo_mainLayout.top
        anchors.topMargin: 0
        font.pixelSize: 24
    }

    ListModel {
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

    Component {
        id: componentDelegate_listViewGallery_mainLayout
        Item {
            id: itemDelegate_listViewGallery_mainLayout
            objectName: "itemDelegate_listViewGallery_mainLayout"
            width: listViewGalleryBackground_mainLayout.width
            height: listViewGalleryBackground_mainLayout.height / listModelModel_listViewGallery_mainLayout.count - 3
            RadioButton {
                id: radioButton_itemDelegate_listViewGallery_mainLayout
                objectName: "radioButton_itemDelegate_listViewGallery_mainLayout"
                exclusiveGroup: exclusiveGroup_radioButton_itemDelegate_listViewGallery_mainLayout
                width: itemDelegate_listViewGallery_mainLayout.width - listViewGalleryBackground_mainLayout.length
                height: itemDelegate_listViewGallery_mainLayout.height
                anchors.top: itemDelegate_listViewGallery_mainLayout.top
                anchors.topMargin: 0
                anchors.left: itemDelegate_listViewGallery_mainLayout.left
                anchors.leftMargin: 0
                activeFocusOnPress: true
                checked: false
                onCheckedChanged: {
                    listViewGalleryBackground_mainLayout.visible = false
                }
            }
            Text {
                id: text_itemDelegate_listViewGallery_mainLayout
                objectName: "text_itemDelegate_listViewGallery_mainLayout"
                width:  listViewGalleryBackground_mainLayout.length
                height: itemDelegate_listViewGallery_mainLayout.height
                color: "#2f4eb7"
                text: qsTr(name)
                font.bold: false
                font.family: "Verdana"
                style: Text.Normal
                styleColor: "#3d5db8"
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.left: radioButton_itemDelegate_listViewGallery_mainLayout.right
                anchors.leftMargin: 10
                anchors.top: radioButton_itemDelegate_listViewGallery_mainLayout.top
                anchors.topMargin: 0
                font.pixelSize: 16
                MouseArea {
                    id: textListener_itemDelegate_listViewGallery_mainLayout
                    objectName: "textListener_itemDelegate_listViewGallery_mainLayout"
                    width: text_itemDelegate_listViewGallery_mainLayout.width
                    height: text_itemDelegate_listViewGallery_mainLayout.height
                    anchors.top: text_itemDelegate_listViewGallery_mainLayout.top
                    anchors.topMargin: 0
                    anchors.left: text_itemDelegate_listViewGallery_mainLayout.left
                    anchors.leftMargin: 0
                    onClicked: {
                        radioButton_itemDelegate_listViewGallery_mainLayout.checked = true
                    }
                }
            }
        }
    }

    Rectangle {
        id: listViewGalleryBackground_mainLayout
        objectName: "listViewGalleryBackground_mainLayout"
        function max() {
            var max = 1;
            for(var i=0; i<listModelModel_listViewGallery_mainLayout.count; i++) {
                var tmp = listModelModel_listViewGallery_mainLayout.get(i).name.length;
                max = (max<tmp)? tmp: max;
            }
            return max;
        }
        x: 5
        property int length: listViewGalleryBackground_mainLayout.max() * 15
        width: 20 + length
        height: listModelModel_listViewGallery_mainLayout.count * (25+3)
        color: "#444444"
        border.color: "#666666"
        border.width: 1
        anchors.top: iconGallery_mainLayout.bottom
        anchors.topMargin: 0
        anchors.right: iconGallery_mainLayout.right
        anchors.rightMargin: 0
        visible: false
        ListView {
            id: listViewGallery_mainLayout
            objectName: "listViewGallery_mainLayout"
            width: listViewGalleryBackground_mainLayout.width
            height: listViewGalleryBackground_mainLayout.height
            spacing: 3
            snapMode: ListView.NoSnap
            keyNavigationWraps: false
            flickableDirection: Flickable.AutoFlickDirection
            visible: parent.visible
            ExclusiveGroup { id: exclusiveGroup_radioButton_itemDelegate_listViewGallery_mainLayout }
            delegate: componentDelegate_listViewGallery_mainLayout
            model: listModelModel_listViewGallery_mainLayout
        }
    }

    /*ListModel {
        id: listModelModel_galleryGridListView_mainLayout
        objectName: "listModelModel_galleryGridListView_mainLayout"
        ListElement {
            src: "../../res/pictures/fond-ecrab-hd-ipad-4.jpg"
        }
        ListElement {
            src: "../../res/pictures/Prince-Fielder-MLB-Hd.jpg"
        }
        ListElement {
            src: "../../res/downloads/Florida+Marlins+v+Washington+Nationals+u07HD4y2lI7l.jpg"
        }
        ListElement {
            src: "../../res/downloads/728410-gt_mlb12theshow_vr_saa_hd.jpg"
        }
    }*/

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
