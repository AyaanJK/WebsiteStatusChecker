<h1> Website Network Status Checker #L001</h1>

<h2>Description</h2>
Checks the network status of a list of websites found in the websites.txt file and returns 'UP' or 'DOWN' depending on the status.
<br />


<h2>Languages and Utilities Used</h2>

- <b>Lua</b>
- <b>LuaSocket</b>
- <b>Batch (Windows)</b> 

<h2>Environments Used </h2>

- <b>Windows 11 Pro</b> (24H2)
- <b>Visual Studio Code</b>

<h2>Program walk-through:</h2>

<p align="center">
Reads URLs from .txt file and return a list of them: <br/>
<img src="https://i.imgur.com/3PLf8ih.png" height="80%" width="80%" alt="Password Generator Steps"/>
<br />
<br />
Checks URL's network connect via HTTP(S) and TCP then returns 'UP' or 'DOWN':  <br/>
<img src="https://i.imgur.com/KuRVwMp.png" height="80%" width="80%" alt="Password Generator Steps"/>
<br />
<br />
Calls the second function and loops through list of URLs in .txt file: <br/>
<img src="https://i.imgur.com/ulpj1jR.png" height="80%" width="80%" alt="Password Generator Steps"/>
<br />
<br />
Create a text file with the commands to run the program: <br/>
<img src="https://i.imgur.com/dUtrzXa.png" height="80%" width="80%" alt="Password Generator Steps"/>
<br />
<br />
Save as a .bat file, so that users can double click to run the script: <br/>
<img src="https://i.imgur.com/Hp67va4.png" height="80%" width="80%" alt="Password Generator Steps"/>
</p>
