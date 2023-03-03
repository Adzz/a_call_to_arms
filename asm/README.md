# Asm

This is the lexer for an imaginary language that compiles to assembly.



Ahh so with Forth the stack based language presumably each function knows how many arguments
it needs to "pop" off the stack so that it can be called.

So when we are thinking about data schema and XML the issue with the siblings is that we don't know how large the stack is so to speak, and we don't know that because we don't know how many tags
there could be inside the given XML.

If we know how deep the nesting was we could say "skip to XX tag"
