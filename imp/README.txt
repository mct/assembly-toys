In Core War (a programming game where programs are written in a fictionalized
assembly language called Redcode), an Imp is the simplest program which can
replication itself.  It is as simple as:

		MOV 0, 1

which copies the current instruction to the next instruction -- and then
moves on to execute that second instruction.  (In Redcode, the instruction
currently executing is always referred to as memory location 0.)

A few years ago, for some inexplicable reason I decided to try to write a
real Imp program for x86.  I ended up with what you see here.  Also in this
directory is an animated GIF of the Imp running in a debugger, to give you a
sense of how it operates.

				-- Michael Toren <mct@toren.net>
				   Sun, 30 Nov 2014 04:13:57 -0800
