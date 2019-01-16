project(HelloWorld)
set(NAME HelloWorld)


set(SOURCE_FILES
        hello.m)

add_executable(
        ${NAME}
        ${SOURCE_FILES}
)

target_link_libraries(${NAME}
        "-framework Foundation"
        )