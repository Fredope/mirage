import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: field
    leftPadding: theme.spacing
    rightPadding: leftPadding
    topPadding: theme.spacing / 1.5
    bottomPadding: topPadding

    font.family: theme.fontFamily.sans
    font.pixelSize: theme.fontSize.normal
    font.pointSize: -1

    placeholderTextColor: theme.controls.textField.placeholderText
    color: activeFocus ?
           theme.controls.textField.focusedText :
           theme.controls.textField.text


    property bool error: false

    property alias radius: textFieldBackground.radius
    property bool bordered: true

    property color backgroundColor: theme.controls.textField.background
    property color borderColor: theme.controls.textField.border
    property color errorBorder: theme.controls.textField.errorBorder

    property color focusedBackgroundColor:
        theme.controls.textField.focusedBackground
    property color focusedBorderColor: theme.controls.textField.focusedBorder


    background: Rectangle {
        id: textFieldBackground
        color: field.activeFocus ? focusedBackgroundColor : backgroundColor
        border.color: error ? errorBorder :
                      field.activeFocus ? focusedBorderColor : borderColor
        border.width: bordered ? theme.controls.textField.borderWidth : 0

        Behavior on color { HColorAnimation { factor: 0.25 } }
        Behavior on border.color { HColorAnimation { factor: 0.25 } }
    }

    selectByMouse: true

    Keys.onPressed: if (
        event.modifiers & Qt.AltModifier ||
        event.modifiers & Qt.MetaModifier
    ) event.accepted = true

    Keys.forwardTo: mainUI.shortcuts
}
