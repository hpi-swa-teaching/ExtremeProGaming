<p align="center">
  <img width="600" src="../../assets/120120832/8b80120c-65d4-48c0-9094-8b8405b708e6" alt="Extreme Pro-Gaming">
  <p align="center"><i>Master XP practices and agile software development as you strategically ascend Mount Agility.</i></p>
</p>

## Installing ⚙️

1. Download the newest version of _Extreme Pro-Gaming_ on the [releases page](https://github.com/hpi-swa-teaching/ExtremeProGaming/releases).
2. Drag and drop the `.sar`-file into your Squeak image, then select `install SAR`.

## Game Elements 🎲

### Event Cards

- **Type of card**: Events represent unforeseen occurrences that happen during the project, either positive or negative, and you execute them accordingly.
- **Iteration**: Shows the current iteration, with a total of nine iterations planned.
- **Title**: Provides a broad idea of what to expect in the current iteration.

### Tickets

- **Type of card**: Indicates whether it’s a Feature or a Bug. The difference is that Features score points but might also generate Technical Debt, whereas Bugs do not.
- **System part**: Identifies whether the ticket pertains to the Frontend or Backend.
- **Effect indication**: When processing a ticket, its effects on project resources are noted, whether positive (⬆️) or negative (⬇️).

### Technical Debt

- Technical Debt complicates the addition of new functionalities and is represented by tokens.
- You see different tokens for the Frontend (red) and Backend (blue). The more tokens you have, the more difficult it is to add new features.

### Story Points

- Story Points are the gummy bears required to process a ticket.
- You start each sprint with a certain amount of Story Points. They regenerate at the end of the sprint.

## Instructions 🎮

To start the game, open a workspace and run `EPGGame open`.

### Gameplay

1. **Event Phase**: The top Event card is being rotated and its effect applied.
2. **Draw a Feature**: Take the top Feature from the Feature stack and place it in the Backlog.
3. **Iteration Planning**: Choose one or more actions for the iteration. You have the following options:
   - **Ticket Selection**: Choose one or more tickets from the Backlog for processing. The amount of Story Points needed is the fixed amount indicated on the ticket, plus an additional amount matching the Technical Debt of the corresponding system part.
   - **Technical Debt Reduction**: For each Technical Debt reduced through refactoring, a Story Point is required. Place the corresponding Story Point tokens on the removed Technical Debt. Be aware that you can only reduce Technical Debt in the system part you are currently **not** working on. If you want to refactor both Frontend and Backend in one iteration, no other tickets can be processed.
4. **Iteration Execution**: Click the `Next Round` button to process all due tickets for this Sprint.
5. **Increase Technical Debt**: If a Feature in the Frontend is processed during this sprint, a corresponding Technical Debt is automatically added in the Frontend. The same applies to the Backend.
6. **Endgame Check**: Review whether any endgame conditions have been met. If not, proceed to the next iteration.

### Ending and Scoring

The game ends in one of two ways:

1. If after an iteration there are one or more tickets left in the Backlog, the project has failed. You score zero points.
2. If all nine iterations are completed without the project failing, you win. You score one point for each completed Feature and none for fixed Bugs.

## Screenshots 🖼️
