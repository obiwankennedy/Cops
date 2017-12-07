import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 1800
    height: 1020
    color: "grey"
    title: qsTr("Hello World")


    FontLoader { id: amplify; source: "qrc:/font/Amplify_PersonalUseOnly.ttf" }
    FontLoader { id: chocolate1; source: "qrc:/font/Chocolate Covered Raindrops BOLD.ttf" }
    FontLoader { id: chocolate2; source: "qrc:/font/Chocolate Covered Raindrops Hollow.ttf" }
    FontLoader { id: chocolate3; source: "qrc:/font/Chocolate Covered Raindrops.ttf" }
    FontLoader { id: dancing; source: "qrc:/font/DancingScript-Regular.otf" }
    FontLoader { id: redvelvet; source: "qrc:/font/Red Velvet - Demo.ttf" }



    Item {
        id: plate
        width: parent.width*8
        height: parent.height*8



        Image {
            source: "qrc:/img/cork_fin.png"
            fillMode: Image.Tile
            x:0
            y:0
            width: plate.width//+Math.abs(plate.x)
            height: plate.height//+Math.abs(plate.y)

            MouseArea {
                anchors.fill: parent
                property int previousX : 0
                property int previousY : 0
                onPressed: {
                    previousX = mouse.x
                    previousY = mouse.y
                    parent.focus = true
                }
                onPositionChanged: {
                    plate.x += mouse.x-previousX
                    plate.y += mouse.y-previousY
                }
                onWheel: {
                    if(wheel.angleDelta.y>0)
                    {
                        parent.rotation -= 1
                    }
                    else
                        parent.rotation += 1
                }
            }
        }


        PolaroidImage {
            id: headshot
            x: 515
            y: 160
            size: 200
            source: "qrc:/img/Lynn.jpg"
            text: " Lynn Gray-Rike"
            text2: "HeadShot "
            rotation: -3
        }
        PolaroidImage {
            id: captainPoubelle
            x: 999
            y: 954
            size: 200
            source: "qrc:/img/Guillermo_Gonzalvez.jpg"
            text: " Guillermo Gonzalvez"
            text2: "Captain \n Poubelle "
            rotation: -3
        }
        PolaroidImage {
            id: columbo
            x: 713
            y: 675
            size: 200
            source: "qrc:/img/max_ohara_bis4.jpg"
            text: " Max O'Hara"
            text2: "Columbo "
            rotation: -3
        }
        PolaroidImage {
            id: luckytarget
            x: 400
            y: 460
            size: 200
            source: "qrc:/img/Denis_Aquillian.jpg"
            text: " Denis Aquillian"
            text2: "Lucky Target "
            font { family: chocolate3.name; pixelSize: 25; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            rotation: -3
        }
        PolaroidImage {
            id: rick
            x: 1878
            y: 1874
            size: 200
            source: "qrc:/img/Rick_Darcy.jpg"
            text: " Rick Darcy"
            text2: ""
            rotation: 0
        }
        PolaroidImage {
            id: kim
            x: 1543
            y: 1569
            size: 200
            source: "qrc:/img/Khu_Ying_Kim_square.jpg"
            text: " Khu Ying Kim"
            text2: ""
            rotation: 0
        }
        PolaroidImage {
            id: atm
            x: 1870
            y: 1564
            size: 200
            source: "qrc:/img/Christopher_Atkins.jpg"
            text: " Christopher Atkins"
            text2: "ATM "
            rotation: 0
        }
        PolaroidImage {
            id: image
            x: 1537
            y: 1875
            size: 200
            source: "qrc:/img/Anpaytoo_Yepa_square.jpg"
            text: " Anpaytoo Yepa"
            text2: ""
            rotation: 0
        }

        PostIt {
            id: post1
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: dancing.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "dancing text demo abc"
            color: "pink"
        }
        PostIt {
            id: post2
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: amplify.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "Amplify text demo abc"
            color: "pink"
        }
        PostIt {
            id: post3
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: chocolate1.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "chocolate1 text demo abc"
            color: "pink"
        }
        PostIt {
            id: post4
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: chocolate2.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "chocolate2 text demo abc"
            color: "pink"
        }
        PostIt {
            id: post5
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: chocolate3.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "chocolate3 text demo abc"
            color: "pink"
        }
        PostIt {
            id: post6
            x: 30
            y: 200
            width: 200
            height: 150
            //font: amplify.name
            font { family: redvelvet.name; pixelSize: 20; weight: Font.Bold;  }//capitalization: Font.AllLowercase
            //font.pixelSize: 15
            text: "redvelvet text demo abc"
            color: "pink"
        }

        Line {
            anchors.fill: parent
            x1: headshot.x
            y1: headshot.y
            x2: 1543
            y2: 1569
            penWidth: 8
        }

    }

}
