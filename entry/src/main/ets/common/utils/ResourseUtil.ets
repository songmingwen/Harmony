
import Logger from '../utils/Logger';

/**
 * Obtains the resource string.
 *
 * @param resource Resource path.
 * @returns Promise instance of a string.
 */
export async function getStringByRes(resource: Resource, component: Object): Promise<string> {
  if (!resource) {
    Logger.error('getStringByRes resource is invalid');
    return '';
  }
  let string = await getContext(component).resourceManager.getStringValue(resource.id);
  return string;
}