cmake_minimum_required(VERSION 3.15.0)

find_package(Qt5 COMPONENTS Core Widgets REQUIRED)

set(HEADER_FILES
    "cpp/GUI/MainWindow.hpp"
)

set(SOURCE_FILES
    "cpp/Main.cpp"
    "cpp/GUI/MainWindow.cpp"
)

set(UI_FILES
    "cpp/GUI/ui/mainwindow.ui"
)

qt5_add_resources(QT_RESOURCES
    "resources.qrc"
)

add_executable(
    ${PROJECT}
    ${HEADER_FILES}
    ${SOURCE_FILES}
    ${UI_FILES}
    ${QT_RESOURCES}
)

target_include_directories(${PROJECT} PRIVATE "cpp/")
target_link_libraries(${PROJECT} PRIVATE Qt5::Core Qt5::Widgets)
