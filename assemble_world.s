.data
  hello:
    .string "World, ASSSEEEEMMBBBLLLLEEEE!"

.text
  .global main
  main:
    push {ip, lr}

    ldr r0, =hello
    bl printf

    mov r0, #41
    add r0, r0, #1

    pop {ip, lr}
    bx lr
