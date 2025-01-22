import * as xml2js from 'xml2js';

interface SvgData {
  svg: {
    $: { width: string, height: string, viewBox?: string };
    circle?: { $: { cx: string, cy: string, r: string } }[];
    polygon?: { $: { points: string } }[];
  };
}

function parseSvg(svg: string): Promise<SvgData> {
  const parser = new xml2js.Parser();
  return parser.parseStringPromise(svg);
}

function calculateBoundingBox(shapes: any[]): { minX: number, minY: number, maxX: number, maxY: number } {
  let minX = Infinity;
  let minY = Infinity;
  let maxX = -Infinity;
  let maxY = -Infinity;

  for (const shape of shapes) {
    if (shape.$.points) {
      // Parse polygon points
      const points = shape.$.points.split(' ').map((point: string) => point.split(',').map(Number));
      points.forEach(([x, y]) => {
        minX = Math.min(minX, x);
        minY = Math.min(minY, y);
        maxX = Math.max(maxX, x);
        maxY = Math.max(maxY, y);
      });
    }
    if (shape.$.cx && shape.$.cy && shape.$.r) {
      // Parse circle data
      const cx = parseFloat(shape.$.cx);
      const cy = parseFloat(shape.$.cy);
      const r = parseFloat(shape.$.r);
      minX = Math.min(minX, cx - r);
      minY = Math.min(minY, cy - r);
      maxX = Math.max(maxX, cx + r);
      maxY = Math.max(maxY, cy + r);
    }
  }

  return { minX, minY, maxX, maxY };
}

export async function cropSvg(svg: string): Promise<string> {
  const data = await parseSvg(svg);
    const shapes = [
        ...(data.svg.circle || []),
        ...(data.svg.polygon || [])
    ];
    const { minX, minY, maxX, maxY } = calculateBoundingBox(shapes);
    const width = maxX - minX;
    const height = maxY - minY;
    // Set the viewBox to the new dimensions
    const newViewBox = `${minX} ${minY} ${width} ${height}`;
    // Build the cropped SVG string
    const builder = new xml2js.Builder();
    data.svg.$.viewBox = newViewBox;
    data.svg.$.width = width.toString();
    data.svg.$.height = height.toString();
    return builder.buildObject(data);
}
