import { createCanvas, loadImage } from 'canvas';
import { writeFileSync } from 'fs';

export async function convertSvgToPng(svgContent: string, outputFilePath: string, width: number, height: number): Promise<void> {
    // Create a canvas with specified dimensions
    const canvas = createCanvas(width, height);
    const context = canvas.getContext('2d');

    console.log("Loading image...");

    // Load the SVG data as an image
    const image = await loadImage(`data:image/svg+xml;base64, ${Buffer.from(svgContent).toString('base64')}`);

    console.log("Drawing image...")

    // Draw the SVG onto the canvas
    context.drawImage(image, 0, 0, width, height);

    // Save the canvas as a PNG file
    const buffer = canvas.toBuffer('image/png');
    writeFileSync(outputFilePath, buffer);

    console.log(`PNG saved to ${outputFilePath}`);
}
