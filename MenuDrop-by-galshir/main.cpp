#include <QDir>
#include <QFileInfo>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
#ifdef QT_DEBUG
    // Get the main.qml file dynamically so we don't have to recompile the source everytime we make a change.
    QFileInfo currentFile(__FILE__);
    const int count = currentFile.path().count("..") + 3;
    QDir dir(app.applicationDirPath());
    for (int i = 0; i < count; i++) {
        dir.cdUp();
    }

    engine.load(dir.absolutePath() + "/" + currentFile.path().remove("../") + "/qml/main.qml");
#else
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
#endif // QT_DEBUG

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
