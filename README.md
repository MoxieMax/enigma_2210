https://backend.turing.edu/module1/projects/enigma/rubric

Self Eval:

Functionality: 3
  The Enigma class and modules all work together when called in the CLI.
  
OOP: 2.5
  I broke out the encryption and decryption methods into their own modules to clean up the Enigma class and to group together pieces of functionality that work together to reach the same end goal. I put the two methods with random generation into their own class for the same reason, and to keep the RNG aspects contained in one place. I'm unsure if any of the classes / modules would be considered unreasonably large or small.

Ruby Conventions and Mechanics: 2.5
  Code is mostly properly indented and spaced, there are at least two methods that are longer than they should be, and with more time to refactor I could probably get them down quite a bit, but probably not with 45 minutes left until submission. There is at least one hash implemented in a way that makes sense (encrypt, decrypt, and shift methods). Shift in particular because it allowed me to call the objects from the two separate arrays of key_split and offset, add them together as a value, and call those values with the keys (a, b, c, and d).

TDD: 2.5
  I did my best with this until I got up to the CLI and user input stuff. My test coverage is at 92%, and when the coverage index is opened the specific methods that aren't tested are all related to CLI and the runner. Some edge cases are considered. I had my spouse come in and try to break some things when I thought they were working just to see what I needed to address. Some things were fixed, some were handled with the way the code was written.

Version Control: 3
  4 pull requests at this time, will be 5 after completing this and pushing it up, 40+ commits. I didn't have merge issues this time, I worked on a branch for all but maybe 3 commits, the pull requests were done when something major was finished, but I did my best to be thorough in the comments when I opened the PR to explain what was in each one in terms of methods. I'm not sure if more than 3 commits have multiple pieces of functionality. I tried to write a test, commit, and write a method, test it, commit, or I would write the test, commit, write the method, test, adjust, rewrite, rework, etc... and then commit once it worked. 