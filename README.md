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
- **Effect indication**: When processing a ticket, its effects on project resources are noted, whether positive (⬆️) or negative (⬇️). Effect may include to add or remove available Storypoints, either temporary or permanently. Furthermore the effect could add Bugs or Features to your Backlog.

### Technical Debt

- Technical Debt complicates the addition of new functionalities and is represented by tokens.
- You see different tokens for the Frontend (red) and Backend (blue). The more tokens you have, the more difficult it is to add new features.

### Story Points

- Story Points are the gummy bears required to process a ticket.
- You start each sprint with a certain amount of Story Points. They regenerate at the end of the sprint.

## Instructions 🎮

To start the game, open a workspace and run `EPGGame open`.

### Gameplay

1. **Event Phase**: Double-Click on the top Event card to rotate it. Read the instructions and storyline. When double-clicking again, its effect gets applied. You can start planning the next sprint.
2. **Draw a Feature**: Take the top Feature from the Feature stack and place it in the Backlog by dragging it to a free place of your choice.
3. **Iteration Planning**: Choose one or more actions for the iteration. You have the following options:
   - **Ticket Selection**: Choose one or more tickets from the Backlog for processing. The amount of Story Points needed is the fixed amount indicated on the ticket, plus an additional amount matching the Technical Debt of the corresponding system part.
   - **Technical Debt Reduction**: For each Technical Debt reduced through refactoring, a Story Point is required. Place the corresponding Story Point tokens on the removed Technical Debt. Be aware that you can only reduce Technical Debt in the system part you are currently **not** working on. If you want to refactor both Frontend and Backend in one iteration, no other tickets can be processed.
4. **Iteration Execution**: Click the `Next Round` button to process all due tickets for this sprint. The chosen tickets are presented to you and you can read about their consequences. By double clicking on the card, the card is automatically moved to the done pile. If the card was a Feature, your score increases automatically.
5. **Increase Technical Debt**: If a Feature in the Frontend is processed during this sprint, a corresponding Technical Debt is automatically added in the Frontend. The same applies to the Backend.
6. **Endgame Check**: Review whether any endgame conditions have been met. If not, proceed to the next iteration.

### Ending and Scoring

The game ends in one of two ways:

1. If after any iteration, there are nine or more tickets remaining in the Backlog, the project has failed, and you score zero points. Be careful: Some cards may add Bugs or Features to your Backlog without you expecting it.
2. If you successfully complete all 10 iterations without the project failing, you win. You earn one point for each completed Feature, while fixed Bugs do not score any points.

## Screenshots 🖼️
#### Begin of game
<img width="1000" alt="image" src="https://github.com/hpi-swa-teaching/ExtremeProGaming/assets/114360057/98c94231-1ed0-4f13-be6e-b11e4810de40">

#### Example Event Card
<img width="299" alt="image" src="https://github.com/hpi-swa-teaching/ExtremeProGaming/assets/114360057/eb73b03f-bd25-47bf-9b00-1e8941cef57f">


#### Example Backlog with Bug and Feature
<img width="493" alt="image" src="https://github.com/hpi-swa-teaching/ExtremeProGaming/assets/114360057/a312432c-5427-460f-a80d-78a9d74abe7f">

